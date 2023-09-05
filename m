Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673C792CA1
	for <lists+samba-technical@lfdr.de>; Tue,  5 Sep 2023 19:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=EjtpG6/BVmZkVrg4KlisvzRC8tC9uJgfXbDFQQx9ZPM=; b=oQIuI8VtZDYVMhplM9QhAZLXdo
	0VR2sOFI8xtgimx5ksA1bTmHKvgL8YRNGOrmAqrb6KvEUvp7Y9cLCNy2F5BrzrQHAYKiSGpGva7dQ
	HfX0j5qjyYDnyRs1l4pxcG/qHbhkwh0O986wJ4Us9+iaiT9IEh6ZCzEX+mKRmFEo6MKuRFQP0PTVV
	kETm+Gix1143SGJq2tS+8rKW7N3hryHkNnz/HrhgzcBi2E4Im8nSplY0gBY3jTlS4gtM+DuWBgmIa
	dgHiaggWokRzNn6ABTvOFwRx1AtqatscTabvltz9whNCuALH8MqGRO3cn6+QhCcKwpFj4oM2mAwf9
	Q5oAhntA==;
Received: from ip6-localhost ([::1]:25124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qda3I-000xSP-0c; Tue, 05 Sep 2023 17:41:24 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:54769) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qda3B-000xSG-IT
 for samba-technical@lists.samba.org; Tue, 05 Sep 2023 17:41:21 +0000
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-412989e3b7bso18663751cf.1
 for <samba-technical@lists.samba.org>; Tue, 05 Sep 2023 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693935675; x=1694540475; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EjtpG6/BVmZkVrg4KlisvzRC8tC9uJgfXbDFQQx9ZPM=;
 b=KFSKPrSNBRGloCcM7aHbEex1ugFzKIIWQTqv/avlOrEpdbnybOq43ejVEjHP/UjmGg
 vcxO9uq4JNgN8aTq3K4fsXwTM/kwTu/1aRlyvWIRAGBijU2IvRKgXQobShX9n2OtmNC2
 rqstDCyP57TRUnLUNFGahExDWBN11mHTapEqy4aFjgdSEIrBPlY6vOf6sk8b07zsnGHy
 0fY5AOez5UiSLCGl5HtNwSDZYZAka48OmjfwmhRkmZ+4Z5wmeeHSpgm7LJFhx/6yEvT/
 CFQrdhgE0tdwjQfK1us6jqzBSJ7PauOENAJ7oB2YGCCek4siDX157/4fZ8ahez0XhD0w
 xStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935675; x=1694540475;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjtpG6/BVmZkVrg4KlisvzRC8tC9uJgfXbDFQQx9ZPM=;
 b=SPwmgxjQrvpNsW6ffHSJvTyPEqu6Y4utM6VF6cDfzTk5NItf2YaCbwpgBou6h21m0z
 uQSGIOAOoUCoOq/ROP1v61cxQqpzksfTQwpzDkFP1nnLaa3ZgOJHz+lNqlS0J+TDLy+7
 42n38gyCfPkwRZWv0/ZcpyL6Y2QmgCfZOgNmYXpk4138MbFBQ6OhwYcy6i6JTmwCuuvI
 AEVlVe3oIvEAMUxe+ABw9h5QM7uax4vgQlOBmUnkFAW50rsD8KJsm2ARseYyu8FAOmSO
 g4l1Ird4tfMEFKVWWWPfqbLyzQRYXLsXtywEQn3qYPzmU2lVSyUGDxFe+vP5gEMnpX3G
 +yTg==
X-Gm-Message-State: AOJu0YxXTC54VacydvyRA0iNM1yQieu5JEbEM0bytRKFicEpO/w7BbHa
 Mo888pCFUnocQ9vvG1YsqSpukWnOINEEHwgzdNLaR+eIaqk=
X-Google-Smtp-Source: AGHT+IFTHdJzwyp45iPdqUrY8BKBx0N9d/te6zIitLZDxbhDqIRbWcfAkDfzOyAInhenxC34Po9T8ukLxBd6UA6TjWA=
X-Received: by 2002:a05:6214:3984:b0:647:13b3:73b1 with SMTP id
 ny4-20020a056214398400b0064713b373b1mr12734447qvb.36.1693935675383; Tue, 05
 Sep 2023 10:41:15 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 Sep 2023 10:37:59 -0700
Message-ID: <CACyXjPwergRhYMWViO=xH4y8a44BU02PxEd1UEZk-DLm_ZR6qw@mail.gmail.com>
Subject: Failed to join domain with un-interpolated string ...
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I am seeing the following errors when I inject delays into certain
SAMR functions during domain join:

"Failed to join domain: failed to join domain 'test.qa' over rpc:
{Device Timeout} The specified I/O operation on %hs was not completed
before the time-out period expired."

However, the '%hs' is not being replaced with an actual message.

Is this expected?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

