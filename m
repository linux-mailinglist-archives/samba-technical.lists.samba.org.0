Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B21FE1CB51F
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 18:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BRw2gsgSGxYe8RsmPIpOWHeFKemslhdaf2w5eUOSGK8=; b=h+iu9wbFbwjBgYgoUIvduwPt66
	IISZpeBATv50ItlE3ZVkbP/jjRkA52NnRMeq99rxAYxEhAcBoSqorzLOkVaIFaJHlQJ4L0MxQoQt9
	zwDy1zdeK/QngfAejgr/hC4iQ07VBCkmTY0ZCo+AOK+bq1n/A2IxDTXF1/bfgnwT7dXC21I9nEtTh
	GAbraDIcrG0uZDRMfE33fztFMACWaf3J5A5A+8MSVsvIsUb1K5CyJ6q0ERK5HludNe0K30UoY1t5u
	rBMQ0UTOmN68ye3ZrtvUGaLe4ZTkzCIwfJfMcbEpRISloF4H1bM/mlnHsZQZELcyj5posxtaDlaap
	ZupLzxBQ==;
Received: from localhost ([::1]:64980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX66y-003FeT-Tw; Fri, 08 May 2020 16:44:33 +0000
Received: from youngberry.canonical.com ([91.189.89.112]:35655) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jX66r-003FeM-LF
 for samba-technical@lists.samba.org; Fri, 08 May 2020 16:44:29 +0000
Received: from mail-oi1-f199.google.com ([209.85.167.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.hasenack@canonical.com>) id 1jX66n-0006k7-52
 for samba-technical@lists.samba.org; Fri, 08 May 2020 16:44:21 +0000
Received: by mail-oi1-f199.google.com with SMTP id j84so6647881oib.21
 for <samba-technical@lists.samba.org>; Fri, 08 May 2020 09:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=BRw2gsgSGxYe8RsmPIpOWHeFKemslhdaf2w5eUOSGK8=;
 b=a2n/che9MBasmejO5QEJTQjyOVVi4LYNIenZu6yfOy2dZZuqjZAF+FhIb40PHymd3C
 t2UXLKYGTpprGaCZR5Dp6Y5gH6ucfN04q6TC+TCR4sKZlFl09aiPbjvBIm/uxIPobgT1
 4F/LfkovHPKhcHyGEICmMe7zQGGTgoCWqoKhpv2SlwcgijJTGLPtXrix0GyCnlIBDv31
 PeuJwAfdp7SbsbOC/WF1npWwLy4KCzkGi0lvItxqRmeFtmsXfaKWP7ObtRGRFZcaYR2g
 +dIiBFkuMKurcRklvNgUyejSfUrSM9JfYCD0JYRji2qhRbvw95esYErsE7CGRXP+FNdy
 EnWg==
X-Gm-Message-State: AGi0Pub95xDBwqeQjpOypaPIuxhNGHGf7fxXFTS41MTn9YuK/YWuyxVd
 vjvt5son9EvyBTTfh3NqTc2KYCX+Fz5xIQ3eUn1z6gAMKDTXVBNJSCYBxLST4LDWyM74KyTqB/z
 BQM+9vrqEmYZeSm622QvcRKg/wcmb7oq+7uuOaXi9JLFwDE0NafS105mb9Pfizw==
X-Received: by 2002:a05:6830:16d9:: with SMTP id
 l25mr2945656otr.108.1588956259754; 
 Fri, 08 May 2020 09:44:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypLGOsBz0W9kjcutp2kenFS4Ycs3+IumGtj212MA1gY4maDmQfcsHhYe5eg/T16xgZJKiRjWqOEQ8btPPUhHzHc=
X-Received: by 2002:a05:6830:16d9:: with SMTP id
 l25mr2945638otr.108.1588956259472; 
 Fri, 08 May 2020 09:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANYNYEHEeDcD+5GL+wCotQG9O1XA1F_i_XmRwcGWbqj15PKxjw@mail.gmail.com>
 <0a650511-9ab0-4501-ee3b-c2c564b3b51f@catalyst.net.nz>
 <9f10bc62317cc9ca891667330e23ce08994962db.camel@samba.org>
In-Reply-To: <9f10bc62317cc9ca891667330e23ce08994962db.camel@samba.org>
Date: Fri, 8 May 2020 13:44:08 -0300
Message-ID: <CANYNYEGMh3YHkRmdw-wUCJSUGRPGeQPV4sUKatLJ7yUame_vUA@mail.gmail.com>
Subject: Re: ldb 2.1.2: test_get_size failure on ppc64el
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks all, I applied the suggested range bump.

On Thu, May 7, 2020 at 7:43 PM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
>
> On Fri, 2020-05-08 at 10:08 +1200, Gary via samba-technical wrote:
> >
> > On 8/05/20 6:16 am, Andreas Hasenack via samba-technical wrote:
> > > Hi,
> > >
> > > I'm building ldb 2.1.2 on ubuntu groovy 20.10, along with all the
> > > other dependencies for samba 4.12.2, and I'm getting this test
> > > error
> > > on ppc64el only:
> > >
> > > [ RUN      ] test_get_size
> > > [  ERROR   ] --- 13369 is not within the range 2500-5000
> > > [   LINE   ] --- ../../tests/ldb_kv_ops_test.c:1721: error:
> > > Failure!
> > > [  FAILED  ] test_get_size
> > > [==========] 13 test(s) run.
> > > [  PASSED  ] 12 test(s).
> > > [  FAILED  ] 1 test(s), listed below:
> > > [  FAILED  ] test_get_size
> > >
> > > That assert use to be
> > >
> > > assert_true( size > 2500);
> > >
> > > but was changed to
> > >
> > > assert_in_range(size, 2500, 5000);
> > >
> > > in commit
> > >
> > > commit e464e40c977cd6592240763c7dbb9c45ff16470f
> > > Author: Andreas Schneider <asn@samba.org>
> > > Date:   Thu Dec 5 17:14:31 2019 +0100
> > >
> > >     ldb:tests: Use assert_in_range() in test_get_size()
> > >
> > >     Signed-off-by: Andreas Schneider <asn@samba.org>
> > >     Reviewed-by: Gary Lockyer <gary@samba.org>
> > >
> > >
> > > Is that 5000 ceiling limit just a guess, or is this failure
> > > indicating
> > > a real bug somewhere? The value 13369 I got on ppc64el seems a bit
> >
> > It's just a guess. for tdb we estimate the number of records with
> > #define RECORD_SIZE 500
> >
> >
> > So changing the test to assert_in_range(size, 2500, 20000);
> > Should be ok.
>
> PPC64 is probably doing something sensible (as in not optimised for a
> 1980s home PC) with pages and so consuming more space.
>
> Andrew Bartlett
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>

