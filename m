Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F04AB296399
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 19:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UwpJJ65yL94f4bb05RoonEVZnLTZ+mFKc2HAkf7PWFw=; b=UqRXNUiSi7arymJKAhQ83bmZdw
	/n9imUMpqWYEKYFRfb16tJyi0mfcAGtFyhkXjH6aexLkqaWpjX7Hm7NgT8WTp+g1uFiAETk3zuQFe
	VHWmDo2XU5NOT1UR4Kf3c9YS9BpIkY+hmI0IbVeFYCZ368ilgJGmcax5SEvOshPOxuVFWmduz+FEU
	VTQJDrVI9L0YvklmD3DOULRLixz+4dQrvdmm/CqBG083RTUB6NZBDahTIIjHMK8J9WV5fg0bGpgO6
	6UiTEY9mwP4gueBAEFKf4vDctkzesc2TKceF0tUZg0eIv5OA1NK2eDK9q6R5GVMzFkORr1irQ/9m0
	4Wtay0sQ==;
Received: from ip6-localhost ([::1]:28060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVeAs-00DKwE-3w; Thu, 22 Oct 2020 17:14:50 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:37531) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVeAn-00DKw6-E8
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 17:14:47 +0000
Received: by mail-lf1-x12d.google.com with SMTP id j30so3209677lfp.4
 for <samba-technical@lists.samba.org>; Thu, 22 Oct 2020 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UwpJJ65yL94f4bb05RoonEVZnLTZ+mFKc2HAkf7PWFw=;
 b=Iui+pE1GhbXAIgBY/myfaDXAn5MYQd5pY34W7nRQpCliI744EuXm48N+wkajUYzaho
 lWd0RDmXc6SGeuK7QM/H6r2vfu66TrkbIpbyBkSam7rsD2dZu8IWQOFXGIWWA5rGBM+5
 rFONJ+MCnkdQjVPtD84j8Up8sX5E3RV8/xtzsycE4tUT1KbnlG4kXFASrPN+70HdSz4Z
 sZ3GvasFGeU5++GfniLr/YeSrQumyDeXijTRjHfhFiSfDVBty5xJjhbwTHSgp28TVI0l
 fTzdhSgQn7xLT0tCHrhe7uE9X/HPC0sxRRzLGukUbg16L8hEvl/hyJhF2Zz0syyD25jW
 YGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UwpJJ65yL94f4bb05RoonEVZnLTZ+mFKc2HAkf7PWFw=;
 b=mKB3NWT2rPpUA/N8Gm2gj2Gx8LSgsmXsPQAgTmWEzieLiTaeZyC4CFTKWTm4fFxZzU
 nio2R76eEmMI720bbVzGHvg17I3m0egn1SILcFHQv0+pJDyU//TsGMXhvEHwsUd3ePkY
 jxI5NTIstG4G7Bd/+I/220THGHSfd7wU2c9r5M9hkn7dZSiMhNQGsf4MtoWCtcDQADIy
 pASUTM1lSm6YvJ1ugJ+hM0zVNPmAC7RqFb4k21l6vZWwYCSjAmFCdymNN1x+6B3+c5K8
 O0KtP9KoVKzdT7fJwnttP3MGblTGTmdmBxbwxYqABFK/VMnt0weBeAEQ5eYDskDD6HYM
 Ga2g==
X-Gm-Message-State: AOAM530Ad2yZimJ9EjxJOYSf0ukrPttfv3UL+2j00cCfOSAnK8ZSfYrC
 utEIMvuLdgLlG3wFTSPh3yZi5TthWkIssgWloXo=
X-Google-Smtp-Source: ABdhPJx6Bv9I/cz3aIWdHhjVto/AxkrWOH3NBC37niei6lGnoAykZV4c/aNJi2LiFfBKlWc4b2vNZwvdEuO3aNtXCI4=
X-Received: by 2002:a19:241:: with SMTP id 62mr1306713lfc.165.1603386883217;
 Thu, 22 Oct 2020 10:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtmPxUKYYK-PbouTFpt9T8AU-41pRZu1CEO=+XLZZ+vSA@mail.gmail.com>
 <87wnziv6dw.fsf@suse.com>
In-Reply-To: <87wnziv6dw.fsf@suse.com>
Date: Thu, 22 Oct 2020 12:14:32 -0500
Message-ID: <CAH2r5mvfhURSj1qOZs4QCaMiqdZbrTRo2+MJgOfaG_RS8OYZYA@mail.gmail.com>
Subject: Re: [PATCH][WIP] query smb3 reparse tags for special files
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

on query dir I see the EAsize set to the reparse tag as expected (in
query dir), but not on FILE_ALL_INFO (query info).

So as you indicated, there are only the query dir info levels (not
query info ones) which allow returning what we need for reparse point
special files - so will have to use fsctl as in smb2_query_symlink.


On Thu, Oct 22, 2020 at 6:37 AM Aur=C3=A9lien Aptel <aaptel@suse.com> wrote=
:
>
> Steve French <smfrench@gmail.com> writes:
> > smbfsctl.h:#define IO_REPARSE_TAG_LX_SYMLINK    0xA000001D
> > smbfsctl.h:#define IO_REPARSE_TAG_LX_FIFO            0x80000024
> > smbfsctl.h:#define IO_REPARSE_TAG_LX_CHR             0x80000025
> > smbfsctl.h:#define IO_REPARSE_TAG_LX_BLK             0x80000026
> >
> > These also make sense for us to use more broadly because it simplifies =
readdir
> >
> > but ... my first attempt at querying this using infolevel 33
> > FileReparsePointInformation (see MS-FSCC section 2.4.35) failed ...
> > with Windows 10 returning STATUS_NOT_SUPPORTED when querying various
> > reparse points (created by WSL indirectly) including fifos, symlinks
> > and char devices.
> >
> > I can switch approaches and try to do the smb3 fsctl to query reparse
> > info instead but was hoping that query info would work.  Any idea if
> > there is another info level that would allow me to query the tag?
>
> According to [MS-FSCC] if the file has the REPARSE_TAG attribute, the
> EaSize field must be interpreted as a reparse tag for these info levels:
>
> * FileFullDirectoryInfo
> * FileBothDirectoryInfo
> * FileIdFullDirectoryInfo
> * FileIdBothDirectoryInfo
>
> Otherwise we have code for querying the reparse tag in
> smb2_query_symlink():
>
>         rc =3D SMB2_ioctl_init(tcon, server,
>                              &rqst[1], fid.persistent_fid,
>                              fid.volatile_fid, FSCTL_GET_REPARSE_POINT,
>                              true /* is_fctl */, NULL, 0,
>                              CIFSMaxBufSize -
>                              MAX_SMB2_CREATE_RESPONSE_SIZE -
>                              MAX_SMB2_CLOSE_RESPONSE_SIZE);
>
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>


--=20
Thanks,

Steve

