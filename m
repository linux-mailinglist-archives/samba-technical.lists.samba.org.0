Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDDF173639
	for <lists+samba-technical@lfdr.de>; Fri, 28 Feb 2020 12:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zNCALXDiWbFo78ok+SmCkTCdVuX0anJX3Mm19gEjb8g=; b=31SSx/+ArALyvy6ZrOq+yEDj4E
	c8Gz4tgmXT2scWc/pKdK8czHz7DYirmUsbNWJMbSE+zxkahGSlyWx6xTfOxtPO99scW3agEQfEeL8
	YcQFu/rC6++ZMl6YDiIxlL1D9nWDkz2LAwwajtsW5CfrCUD83xXdW7/9IKRyffe0eL1v16LwJ956L
	EY8JPRa9mZaSH7zIXs8s4J0vVKfV9ZB3zzvtwxyM3em9icscSzS21RLiFXU3+NvTxDsngAJzwxUWV
	cP5M6SIHu3kw9KoI4p+iK1YusJP5apk09LXF+HHGtrSYEcIygLOqTKTpl/ZMtLsk6pjPunn0VKHyp
	DO01Vamw==;
Received: from localhost ([::1]:57030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j7dzs-00CGJM-As; Fri, 28 Feb 2020 11:40:00 +0000
Received: from mx2.suse.de ([195.135.220.15]:50122) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j7dzo-00CGJF-14
 for samba-technical@lists.samba.org; Fri, 28 Feb 2020 11:39:57 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4A61B1E4;
 Fri, 28 Feb 2020 11:39:53 +0000 (UTC)
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Subject: Re: [SMB311][PATCHES] parse posix create context in order to handle
 getattr
In-Reply-To: <CAH2r5mvW_cpUhg-JA7pFd=rcYSSvT43rT2z9RGbkUpdR1fiLsg@mail.gmail.com>
References: <CAH2r5mvW_cpUhg-JA7pFd=rcYSSvT43rT2z9RGbkUpdR1fiLsg@mail.gmail.com>
Date: Fri, 28 Feb 2020 12:39:51 +0100
Message-ID: <871rqfaqk8.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Steve French <smfrench@gmail.com> writes:
> First 1/2 of changes needed to support SMB3.1.1 POSIX Extensions
> support for getattr (stat) - the main remaining item left for the
> Linux kernel client support of the SMB3.1.1 POSIX Extensions.
>
> The patch from Aurelien allows SMB2_open() callers to pass down a
> POSIX data buffer that will trigger requesting POSIX create context
> and parsing the response into the provided buffer, and the second
> patch fixes some minor problems with the first patch.

I know we want progress on this but this patch is part of a WIP series I
shared with Steve not meant to be sent here yet (cf all XXX which I use
in dev/debug). Thanks for spotting the errors and typos but please don't
merge this yet. I will send an updated version if you really want to
have it.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

