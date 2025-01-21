Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD6A178CE
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 08:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gBUGOWx0dA1erUkhzVO+6Li6v5+nh1tXUAjECiCTLEU=; b=YptTKR72CXk5thsnyHH/X7qfu1
	KTSPaoSwTvSZMiq/OptYX2bW0hk3DtY/P5n6STkX5lZ9Rz+PlnKPKtnGZto/vDTNIKlUBAjVQ2kgZ
	jKEiJFLd6DtDCe3ivoF97SQhMHE9IQV6EhIXv2jlOW/7/rEJJ30PyD3mS63AVnOLGYy5+J7fz3ovG
	fg/112YdYNNg+aPhtLyrlLEe6A21UbvxlTh7c5ToplR3GZ6JtcYpbbK8SBQuBNdGvxvkGE1+PhB0d
	/9pwTRcfpw4pTEQwhEq8HJS2VrAtWIlB99chgYkreRTQGn53Au8uT+0s3cgvxQwH2ouwiB4C6aaw1
	Z1O83fnQ==;
Received: from ip6-localhost ([::1]:55760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ta93U-008tT2-Io; Tue, 21 Jan 2025 07:52:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35412) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta93O-008tSv-N5
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 07:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gBUGOWx0dA1erUkhzVO+6Li6v5+nh1tXUAjECiCTLEU=; b=VBKg3IItnZb4+vr8ktbdmwo8r1
 pO8VORL9dkbRm0ORnkuiVZnOxSFPKGnT/13N8m2BVSqFOPLypLQvpedSJF0v4DL/F51KvQ3BPFM+q
 mBqu1Z+d+4HtNPekCR+JbJebTTYMauG5LQCo+sRvhJ79FwLZNXPmVlcJHqhpD51AyaDPipe2Dh2x2
 lGsnmgc3eerAyEEhRHpmNgW7iB/Lul/U+6vFc85lVYM4kqbVAE5xpVSOoXx0nPDnWwXVAMx/gA/QC
 JCeNdrmNQiDSUtN+JG+3I98NtX+WjWvBFcg6b4QHGPOGYrGXaRFWNChYrVyrc0lD/oL47wYrInAQO
 5U/in1bPkVpDxzmLcMb945N13fF9UJMiT3hDUN09w+iecZ+/9p6qY6PFkdBngG7CKtVcIAUDzlyJq
 TxHBUvQZ0tibAVKIxmCH99HR87q1vuOEhxFMqj7JmGyoaH09uEhWhWBBFEMYpebPWxR0CAF8jhd8h
 +wg+8b57coy6bGUSCYhlLYOO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta93N-001CoD-0o; Tue, 21 Jan 2025 07:52:05 +0000
Date: Tue, 21 Jan 2025 09:50:57 +0200
To: Steve French <smfrench@gmail.com>
Subject: Re: Local KDC and Samba
Message-ID: <Z49R4dLTkUwrhKG1@toolbox>
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z43pEk7WDs6dTQ1M@toolbox> <4942506.OV4Wx5bFTl@magrathea>
 <CAH2r5mtDJ2avG3Z=-pMSO33GNqjSyw6qbMATLJFLx_pVBiSasA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mtDJ2avG3Z=-pMSO33GNqjSyw6qbMATLJFLx_pVBiSasA@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Пан, 20 сту 2025, Steve French wrote:
> have you done any experiments with cifs-utils and cifs.ko?

No, we haven't yet. 

cifs.upcall.c needs a bit of a rewrite. Right now it forces krb5 mech in
GSSAPI calls, that needs to be changed to use iakerb or krb5 depending
on configuration. Also, currently cifs.upcall.c does not always go
through GSSAPI and rather chooses raw kerberos API in some cases which
arguably should not be done this way if we ever want to support IAKerb
proxying.

The logic right now is the following:

 - if we have no credentials identified by cifs.upcall, use GSSAPI, in a
   hope that GSSAPI would pull a credential somehow

 - otherwise, pull creds manually and construct a GSSAPI-like exchange
   manually

The latter will not work because it assumes you direct line of sight to
KDC which is not the case with IAKerb: you only have line of sight to
SMB server and SMB server has line of sight to the KDC (be it local or
remote, doesn't matter).



> 
> On Mon, Jan 20, 2025 at 2:33 AM Andreas Schneider <asn@samba.org> wrote:
> >
> > On Monday, 20 January 2025 07:11:30 CET Alexander Bokovoy via samba-technical
> > wrote:
> > > On Няд, 19 сту 2025, Steve French wrote:
> > > > Is there documentation (or example howto, walkthrough etc.) on how to
> > > > setup the new Local KDC features of Samba server?
> > > >
> > > > I wanted to try some experiments with the Linux client to make sure
> > > > the new type of krb5 mounts work fine.  For the server I am using
> > > > current Samba master branch on Ubuntu.
> > >
> > > There are bits and pieces which aren't merged yet in both MIT Kerberos
> > > and Samba.
> > >
> > > Your best way of testing is by using COPR repository Andreas created for
> > > Fedora as it includes prepared packages.
> > >
> > > See https://gitlab.com/cryptomilk/localkdc and
> > > https://copr.fedorainfracloud.org/coprs/asn/localkdc/
> > >
> > > Andreas gave some insstructions in this comment:
> > > https://github.com/SSSD/sssd/issues/7723#issuecomment-2597864370
> >
> > For using IAKerb you need smbd and smbclient built from:
> >
> > https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-iakerb
> >
> >
> > Edit the smb.conf and add:
> >
> > include /etc/samba/localkdc.conf
> >
> > at the end of the [global] section after you ran localkdc-setup!
> >
> > You can then connect to smbd using the mdns name of the machine
> > (<hostname>.local).
> >
> > Example:
> >
> > smbclient //samba-iakerb.local//share -Uasn@SAMBA-IAKERB.LOCALKDC.SITE --use-
> > kerberos=required
> >
> >
> > Best regards
> >
> >
> >         Andreas
> >
> > --
> > Andreas Schneider                      asn@samba.org
> > Samba Team                             www.samba.org
> > GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
> >
> >
> 
> 
> -- 
> Thanks,
> 
> Steve

-- 
/ Alexander Bokovoy

