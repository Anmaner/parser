<?php

namespace App\Controller;

use App\Entity\Job;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field;
use EasyCorp\Bundle\EasyAdminBundle\Config;

class JobCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Job::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            Field\IdField::new('id', 'id')->hideOnForm(),
            Field\TextField::new('title', 'Title'),
            Field\TextField::new('salary', 'Salary'),
            Field\TextField::new('company', 'Company'),
            Field\TextField::new('text', 'Description'),
            Field\TextField::new('externalId', 'External id'),
            Field\DateTimeField::new('createdAt', 'Created at'),
        ];
    }

    public function configureActions(Config\Actions $actions): Config\Actions
    {
        return $actions->add(Config\Crud::PAGE_INDEX, Config\Action::DETAIL);
    }
}
