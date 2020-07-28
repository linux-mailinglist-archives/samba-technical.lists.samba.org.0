Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816C23042F
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jul 2020 09:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=h66f0WqTSq8fMiJr/YZkQkMJa2xUPTeehmUbCVLEUSs=; b=Qot2AvglmPYFfWr7A46gBsWpR2
	gHxhREAuiyAOAUcHWSMfN2jcY+t8BElXC7W0FevINUR5+yXUISo8DsGHpSdt9q9N90keAoeK45eMh
	pW0H1xR49UjrpCU1N+Qa/D/EqNg+hTBx+HnPUIlGT1SMysd5HPg1RhNT9M1dhtWjYPzUVAsGNOCVt
	WAHOYmvDj+nvNYHcpbjCqI64m7ojuE6Nnjfi3LfKNIs+TO5i5ZYej5TFx7b8tm93viyqc25HKdqKU
	n0HcJONbLL45QihVxTI0zdwaWSOHjdZGkAAXybOViQ8BFdNHo5dCZfnN84mmYRExknYGXedmO+EwD
	Bqfz2LAQ==;
Received: from localhost ([::1]:56692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0K8N-00A7Z3-3V; Tue, 28 Jul 2020 07:34:47 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:42048) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0K8E-00A7Yw-Vl
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 07:34:41 +0000
Received: by mail-qv1-xf44.google.com with SMTP id dm12so8695922qvb.9
 for <samba-technical@lists.samba.org>; Tue, 28 Jul 2020 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h66f0WqTSq8fMiJr/YZkQkMJa2xUPTeehmUbCVLEUSs=;
 b=l85PQwsz+98pt4GNP4NqPedpvvRwu8B1JxKhae4UaIUQpNQzzRwGkcjcp/O2Yftg69
 uLBzWKr2mokPLajVE6DmOnVUG8OQVNousF9NdcTmKXqOjIm2cWrSd5rdYMCUe543htPU
 NIGQPHvOgWkWLseJz6uz2VRp6K/0XOh78BsD433qkXeNUBQ7P6WbHclz3dgK14ApXRH1
 SItSLVTYhabzjVollMnc64PkpIH6Yxq+KyyGmyJ77KJp+/mfvgeVeww1z8Fu8psHwliH
 pxfG9nYkEC3OXDdojj+8j1080jloWuJCc/R8QbeIe1Yxe7LwVEDX3jDSMwSqVnK4YhQb
 X3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h66f0WqTSq8fMiJr/YZkQkMJa2xUPTeehmUbCVLEUSs=;
 b=tJx9Dms1q7vF66y6BSv+bFyGbQJzbUhu5GDmvRGgpVZDqeM9ycwQZ1QR6HlxGJ5nX1
 Rf0tXXt9TX1Myh8+96V2VflVM109W9GS0S8fP8UpTxR+Soy/ympvok1vIK4C76POS7+Z
 lzbDdyf8KhDHPTVV6d2PyXWDkISBEi8H7axmqhlr23s4CLgvUbafGUL92jLfE4JBtBnT
 IO8xTi+hlj5qseFX/Snf5KY+P267fH4UyfzOD20flSHDvd5qyWjAMeWJFth1E1ObDbS2
 sYOhtbBECW5W5vZ2mLQVXQIt7kKfYK9K/8SAKCAvQh6O6lyQyJxmPkzPEAW4OINYtXsG
 8g9g==
X-Gm-Message-State: AOAM533VIoREsi1pURMpfB6IPRVo1D/+qWAmE7XuqJ3EEtXx/39MX8OA
 /5w9IXJbihyeKj4l1z9Sgsz1yV791r+r7vk/GhwIOjmLR2Q=
X-Google-Smtp-Source: ABdhPJyzLhLJANlJEMwZVlV+wAVwlPzYvKpNxH+k3GNITqFSUMZmC4q4E4P75grbcGBbACXxRh4oNMnzvwARU9GebnU=
X-Received: by 2002:ad4:518b:: with SMTP id b11mr14170702qvp.139.1595921676225; 
 Tue, 28 Jul 2020 00:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
 <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
 <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
In-Reply-To: <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
Date: Tue, 28 Jul 2020 09:34:24 +0200
Message-ID: <CAC-fF8QT9N8qjErAkNMFXd595NMTadwt_rD7siXjk_NhqNZS_Q@mail.gmail.com>
Subject: Re: Samba migrate from ver 4.11.11 to 4.12.5
To: Stefan Metzmacher <metze@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 admin@prawda.net.pl
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 28, 2020 at 9:28 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> Am 28.07.20 um 09:21 schrieb Isaac Boukris via samba-technical:
> > On Tue, Jul 28, 2020 at 8:57 AM admin--- via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >>
> >>
> >> I thing I have problem with encryption, ver 4.12 not supported DES and I
> >> see in log:
> >>
> >>   Kerberos: Server not found in database:
> >> <mailto:ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL>
> >> ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL: encryption type 3 not
> >> supported
> >>
> >> How migrate old database encryption to supportet in samba 4.12?
> >
> > It's technically not possible to convert DES hashes to another encryption type.
> >
> >> Change user password not help.
> >
> > Try resetting the server secret and regenerate its keytab (ldap/debian).
>
> No, I don't think that's useful.
> Adjusting msDS-SupportedEncryptionTypes for debian.prawda.local from 31
> to 28 should help.
>
> @Isaac didn't we had a fix and a bug report for the problem already?

Ah right, it's: https://bugzilla.samba.org/show_bug.cgi?id=14354

