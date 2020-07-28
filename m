Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF62303FB
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jul 2020 09:22:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PQLBuDF9XhnoGEtiq3pwQDEhZD2OM8xWfRXMyd2hAsg=; b=2315DEis/2BAH4UCn++Ctzch67
	MAZbSjQdBKRaEqUWe5MM0YONIL8B4LeT3JzZ+gpFIsvq9Ab/jKUoDT36w0NQlt9CF6hVIYDfsqePF
	xshnJWmCrMA7Ctu1ThugakqxzCjTeYMPri8xvign2ZKX76ZXE4E3iSd/GYDeiiIKP2qVx2M4azbyi
	t82fBcQF1QPqMnjOLnyV8SJkUnNMOWm6SlNiH7LgbZnJOYbI5LJFWr1m4nAygnPfReCWWioUotXku
	QiuJQMTaRA8u9Np4DnWXr9soy4lueEXwvTEnEFPfSjUuZyFx78vf0ToRr0RDW5Q9nlsymEPKzC/ws
	LPjbeDdA==;
Received: from localhost ([::1]:54394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0JwM-00A7Dh-Nc; Tue, 28 Jul 2020 07:22:23 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:41245) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0Jw9-00A7DZ-3G
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 07:22:11 +0000
Received: by mail-qk1-x743.google.com with SMTP id l64so10974328qkb.8
 for <samba-technical@lists.samba.org>; Tue, 28 Jul 2020 00:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQLBuDF9XhnoGEtiq3pwQDEhZD2OM8xWfRXMyd2hAsg=;
 b=gh0DwqPsbk27yoq+oYzxOcSqa4x/l5uwvYCZvccs4Lrfu6WSTkUKPPLPPdFolaEQoK
 qKxRBcVEIWMuua6Jb0oW6voSmcW1+uESlH5dtzQD4x7/IpArfHO3e/5UK064YykrlKKp
 2foG/qghwIa6simSjJHRIIt+Sx1KsxXfxlfNxZYxRwc8G/YeGUIolGm1a/KjL7/V04OH
 Wkl0MbdKzyIK5mDOIwwsx1jbvAE3qxcxEbo6gKjNDD3C9ooEiauBsFYjStCPQOPaTbAV
 cK2nx7QmC8TKnOP/seObqi9uO75KFHopcylPWJ6p97Z7GsP9Vew1Zymi011nBfJIg0/a
 cn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQLBuDF9XhnoGEtiq3pwQDEhZD2OM8xWfRXMyd2hAsg=;
 b=roejRLKSQzaB5tnaQyrtIabZ1yRxKKb9UR0PydV/rauvGhOFbX+lI8JcPmgDhGIPTZ
 xHIGTxxuFor4IQMRaPiV0x+fkNAkhvyYM3yBR6LuAwWhuIi23ls5wKyjDDwf6g4Ojnho
 a9BGMVixj5obpgm/0ddx8GUGvKpDtfJ21o/a7AaNs6FcenHjhA5NAKxifhKxhZvRX2J+
 brT3q8X7+op37pXkQUAlhc6KdnSxs4GamfHzk/b241Vl9sX1Ms0OjrpXGy2ke4Z18JOD
 lPhSeWt75HpnzEk6cRVE/DX4AZtDkWmCwBvSrrkqqnTuzlkLyFXMpTf78Tfg46FWe+XC
 r0WA==
X-Gm-Message-State: AOAM531x5h70EzKJagCkwCKlSdAaidEuIGyYwdg7MJae+UVnBypOLKoj
 Xcwb+eEBw6qNv7DpT6hLFa8v67QQ1TA4jFSTQWM=
X-Google-Smtp-Source: ABdhPJwVRSGdhPJPVv6er+p13GbZYmRBjtRAAtkjFmR2njRD/LwCFgKZuCDKYw3HTtnzujM5gue2tAahEy9cKatL3mE=
X-Received: by 2002:a37:6502:: with SMTP id z2mr26643654qkb.213.1595920927212; 
 Tue, 28 Jul 2020 00:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
Date: Tue, 28 Jul 2020 09:21:56 +0200
Message-ID: <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
Subject: Re: Samba migrate from ver 4.11.11 to 4.12.5
To: admin@prawda.net.pl
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 28, 2020 at 8:57 AM admin--- via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
> I thing I have problem with encryption, ver 4.12 not supported DES and I
> see in log:
>
>   Kerberos: Server not found in database:
> <mailto:ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL>
> ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL: encryption type 3 not
> supported
>
> How migrate old database encryption to supportet in samba 4.12?

It's technically not possible to convert DES hashes to another encryption type.

> Change user password not help.

Try resetting the server secret and regenerate its keytab (ldap/debian).

