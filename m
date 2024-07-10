Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4BA92CDFE
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jul 2024 11:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qzVwGh5lfi8WMsnbEdmfVHnMhLj7jpDMJHMnyDucIRs=; b=NykrmyCeqoHmIYnUU2T2mAFrfl
	a0z4IFCJ+i2nhIAFaaZuICoGGWZd6cjqFwbZMtouMwPywrw3byVCkmaEwGrn1uRWCAU/2mWlOvoQ9
	66crmBrEyzskm/0LCFfBneOuNbk4KZQruMVmn4xk3mQgM3fsEQE3qMmH7XgtAMle5u2KjEzoB68mw
	9tIZWMIn5Fll2fnpe+k7N1iqmtJwbgaH4BKv/x/3VI71yVGIbw41XiTFnYBInM46BgEV9l4ldUXtg
	0h1UgV//u7ZkV5V4aGxtGobnkS54hGQ4J6cENC46TWoISCD021dnWkvWOtam0YeS448M1Wh5Ce1st
	mcLoXSTg==;
Received: from ip6-localhost ([::1]:21204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sRTOk-000Lzx-FK; Wed, 10 Jul 2024 09:14:02 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:50212) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sRTOg-000Lzp-57
 for samba-technical@lists.samba.org; Wed, 10 Jul 2024 09:14:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-585e774fd3dso7906456a12.0
 for <samba-technical@lists.samba.org>; Wed, 10 Jul 2024 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720602837; x=1721207637; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dIlC+2Xt+32fkKYTAyoBacrSR8RJi5jbw6ESx2yOcZ0=;
 b=MpQbAvHsuDeokYqBWs9oIyddoja97RCZ9NazuOsPFEPx5CVcP/1ouVQkAdf8pBEITs
 Szhjv+4XsFH56v5V4exxpqb7VeiwSEEyappb1RecCGGnNPz/4PRa0WNXu10FVZ8IBDqe
 E9NlI0QZ9EZBM50F8bQmJsRP0JpGa+q4YFBP55nhRZYzwIzyr1WrV2m7brHSWFZYByJf
 eFmOdKx9+L2H4NXkrkLO307CORZqI9Mb8CcK2JjMKc+sjbOvQDf477kWDmjejqpxHtFR
 /QieqA5qsP7n3d/opN2iOEMpFbAdcvpFOlbvvnp+iGYSgez6ty39J2fzJHs6dWdHEg6R
 NcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720602837; x=1721207637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIlC+2Xt+32fkKYTAyoBacrSR8RJi5jbw6ESx2yOcZ0=;
 b=lm56P+x4DYb1lVfAKUSsbQXEIPPfkesX0FWV7MPT1TzGv2O+UqnW/Pr2DKAfbSmyiZ
 zixky9ol1cnb9c+XWMlg+EiWtxawHPQMnCJoMvPKs37xXrUOZfk+9oo3EGQZcVlQmteX
 fA+ZHaHhmlI7BAgF7CMxp1JWn0YEtjqsHPilJpwd2gwdupVxl8V+npXDYj+71+Z1FC34
 ESxnGuV/GZ4JrvkHapYUC2RcaVWwH1eEXIneOCP4PEGBNQ/JrtJ27cRtKBy915jJooux
 xD6IT6XYdSFMm8lSWex1OaRI70BicN+Zz+q8r8lkZbaG0D++wQRk1yxOwC4/NicQuPR0
 BIxA==
X-Gm-Message-State: AOJu0YyzkrHaEAiwPJ1fg9OlA1kiP+p5swojbgpSKf71RDXSRIBJuwod
 MACPUNt8UoW01CEjuom8lnLozFqfIjIiCa3GyQJC/Y7XJJ0GKB2P4f49SytzTjjEgMZEEmyDDIR
 kdDb5PgUvlEXHoU2LVi0RDg2fgTvvgfcgGEaWhQ==
X-Google-Smtp-Source: AGHT+IGh1LPrO9Q1xY/8FGCj2mB+sEnJbiRAV5GRbrrcjMvaFoaE9uEzDbFYMgyW1eN/7jiPu8hgYRnJjoGh42CCTvw=
X-Received: by 2002:a05:6402:518d:b0:58c:2a57:b1e7 with SMTP id
 4fb4d7f45d1cf-594ba98ea54mr3857720a12.8.1720602836701; Wed, 10 Jul 2024
 02:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAAu4aPGRqJd7sGeocixh=Zkv0X85HSXtJcJZsM7VM7gPVQx=Wg@mail.gmail.com>
 <013b26e5fc784d1286303a15a93a62afe69fe733.camel@samba.org>
In-Reply-To: <013b26e5fc784d1286303a15a93a62afe69fe733.camel@samba.org>
Date: Wed, 10 Jul 2024 12:13:36 +0300
Message-ID: <CAAu4aPEHBXzOm+sZcYwZOci=Ue=h0TP=DztJurb-BRqV-wLuFw@mail.gmail.com>
Subject: Re: problem transfer domain dns zones and forest dns zones
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Omnis ludis - games via samba-technical <samba-technical@lists.samba.org>
Reply-To: Omnis ludis - games <sergey.gortinsc17@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

yes, I conducted manual testing first from the windows server side and I
managed to change the owner through adsi edit by connecting to a
samba-based domain controller, then I found a variable that needed to be
replaced and performed a role change already through the samba-tool fsmo
role transfer --all -U Administrator command, I was asked for a password
and that's it the roles have been successfully transferred

=D1=81=D1=80, 10 =D0=B8=D1=8E=D0=BB. 2024=E2=80=AF=D0=B3. =D0=B2 12:09, And=
rew Bartlett <abartlet@samba.org>:

> On Wed, 2024-07-10 at 11:34 +0300, Omnis ludis - games via samba-technica=
l
> wrote:
>
> while transferring fsmo roles I encountered a problem transferring the
>
> DomainDnsZones and ForestDnzZones roles in samba 4.20.2, I went to the
>
> samba source code in the fsmo.py file and started studying the code snipp=
et
>
> in the Transfer_dns_role() function
>
>
> if master_dns_name !=3D new_dns_name:
>
>         lp =3D sambaopts.get_loadparm()
>
>         creds =3D credopts.get_credentials(lp, Fallback_machine=3DTrue)
>
>         samdb =3D SamDB(url=3D"ldap://%s" % (master_dns_name),
>
>                       session_info=3Dsystem_session(),
>
>                       credentials=3Dcredits, lp=3Dlp)
>
> and then I discovered a problem in the line SamDB(url=3D"ldap://%s" %
>
> (master_dns_name)
>
> you must use new_dns_name, otherwise the following error will occur when
>
> transferring roles.
>
> Failed to add role 'domaindns': LDAP error 53 LDAP_UNWILLING_TO_PERFORM -
>
> <000020AE: SvcErr: DSID-03152DA8, issue 5003 (WILL_NOT_PERFORM), data 0
>
> since the ability to make corrections to the owner of the video is
>
> prohibited by MSAD, please fix this in the next version of Samba
>
>
> I assume you mean that the change to the FSMO role owner must be made on
> the new FSMO role owner?
>
> Perhaps submit a merge request with this, including a test (or at least
> checking that it is covered by an existing one) if possible?
>
> https://wiki.samba.org/index.php/Contribute
>
> Samba is often not quite as strict as windows, it would be great if teste=
d
> changes to tighten this up were also contributed, but that would be a
> harder task.
>
> Andrew Bartlett
>
> --
>
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead                https://catalyst.net.nz/services/samba
> Catalyst.Net Ltd
>
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group compa=
ny
>
> Samba Development and Support: https://catalyst.net.nz/services/samba
>
> Catalyst IT - Expert Open Source Solutions
>
