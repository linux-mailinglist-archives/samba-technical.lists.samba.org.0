Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6E6FCC22
	for <lists+samba-technical@lfdr.de>; Tue,  9 May 2023 18:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1u3A8Ncz2WN2uXzMRy97MCGh1jgnUJLNeQL8gv71ayQ=; b=ZW2m/OpuHx9hR+UbDlARsqKont
	ycqo6JZWKwoXOyKSGIVYtb0LvYTN5BrQJmvMEqDDeB5ehh1Mo3P3LfbyALEQs2cLc39mujQGZiqKa
	5HiaZqV09/KLX+AEGvD8y+iWeB6r6UqbTxQrAG0KOOUf6ovAbNCSY3YONMtYzjl/qamUGXojwuF7P
	fk8cmjU7UC2ldToburucpDsCzw//8Fr7xlRHx947tefRwmUg+tdmxvdmICZf7g4/OSqMp9tQwESHd
	kbs6OuRhtX/FLHrDJs8qmKR42YxPrkE8IwQeWnGjVYc6UT2t5cC9t8sJGx6MHL1EW+MOW5K9epCxI
	epG7vaKw==;
Received: from ip6-localhost ([::1]:38206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pwQfu-009CMM-3v; Tue, 09 May 2023 16:58:54 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:45274) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pwQfo-009CMD-Pc
 for samba-technical@lists.samba.org; Tue, 09 May 2023 16:58:51 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-b9d881ad689so7920104276.2
 for <samba-technical@lists.samba.org>; Tue, 09 May 2023 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683651527; x=1686243527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SJG8iRUXpwotqpCoEhusYLatft1T/Hhw2ZunIl2DAxA=;
 b=WXztJBDd0HxYynEHBz4wLFUjtrwiYIiddOqo2zypp5jNeZ9nVVMfQ9a9A0qo/z+uyz
 3zp+H4MNW2B1zUctpupeoFb4y4gCCF3CBDOjBS7ruuG2+sCFUdWyHDZVKqZw+nAuoNT8
 Vk0gFNSS7fGvEGIkT01VqCep6ZpTE9uAZFDfiewVAku7phXYDEe2jam8DPIUD1fdPp3S
 gpxaQ/wQ304HO/igQO9xRNY/YBi0kUuR9VeDoVRBSoWeyfaxmJK4ASEINzLqWBUtEUi8
 kPjk2SIg4IPzUbRk0xDIi2tnt9xp3lZHSqWAryC+kxnWr/VZsSnjvhuTe6ZW/V5i64P8
 TGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683651527; x=1686243527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SJG8iRUXpwotqpCoEhusYLatft1T/Hhw2ZunIl2DAxA=;
 b=KQwh48AJSBRnlh32Fo8Esc1/oMpHn99AmObaYHayWqX3jY58NMnd+IelfDvqGfIvsZ
 QTfZ8jPBGeUJzm3f0a4KgOPiOiMU+YB0RSBUpVdZMTAbyzSekTrdIPDlzbJnfhzCBF1d
 1KYbhGnA69sl5hgzaOVNCkVvFR+4yW7+4T+ouUQMv/svqJWNz5zZv5bjoB08Dn81brge
 mnjUIH1A6ThFycBQjiv4wzDMrZ83gEZ+3GGCQm+wGaW0ySHCeaoFVi/hVyng/wjfcApW
 l24qJJ5K4NNp4UCHeIrcgOBmMON89Oh6wPFV4q2ME2fCFGmrndeMJuFnxcXz1zzreBTw
 TLng==
X-Gm-Message-State: AC+VfDynk+Xki154p2oushEBB1eAipLTCp1zB1Kf9VJkaZ8zTmgN7rN9
 sS5K41nfaemQwU+uCSLdxuiyYttR25bxCnkpmeM=
X-Google-Smtp-Source: ACHHUZ7YVC0uzV+cQ3yuN2aIAaIi7ML+o/Q48c2X+YfZZ2OnYNWuhB0G+b3IreQG54gbHvVsluOKWfhwuI0HnzSlHeM=
X-Received: by 2002:a25:c787:0:b0:b92:5d8d:aa64 with SMTP id
 w129-20020a25c787000000b00b925d8daa64mr18440247ybe.43.1683651526667; Tue, 09
 May 2023 09:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAH_vq2GJs3HU2DK0tjHyq7eJT8FD-wPa2erLNk1+OmTBXvaKfQ@mail.gmail.com>
 <ZFkUfX3wj1Ly70JP@jeremy-rocky-laptop>
In-Reply-To: <ZFkUfX3wj1Ly70JP@jeremy-rocky-laptop>
Date: Tue, 9 May 2023 22:28:35 +0530
Message-ID: <CAH_vq2Hv1cSNqp0whUQFaHa1QxSMBd1BuYOMs2Mpz9fKOQU9Fg@mail.gmail.com>
Subject: Re: Same error code 13
To: Jeremy Allison <jra@samba.org>
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
From: Vikram Bharti via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vikram Bharti <vikrambharti33@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks a lot.

Can anyone also  share the working  example of smbc_listxattr() attribute .

Will it help to know the list of permissions for users of specified
directory.

Any working output of this API smbc_listxattr() would be also great.


On Mon, May 8, 2023 at 8:55=E2=80=AFPM Jeremy Allison <jra@samba.org> wrote=
:

> On Mon, May 08, 2023 at 06:42:00PM +0530, Vikram Bharti via
> samba-technical wrote:
> >Hi Team
> >
> >I am using libsmbclient API *smbc_getFunctionOpendir *to  open a
> >file/directory . This function returns *error code 13 *in case of *wrong
> >credentials *and also in case the user is not having permission to view
> the
> >file/folder. Now I am unable to interpret whether the return code is due
> to
> >wrong credential or forbidden access.
> >
> >
> >Is there any such API which can *list out the allowed permissions* to a
> >specific user . Or just to verify whether the * credential i*s valid for
> >shares.
>
> If a credential is valid for a share, you should be able
> to open the root directory of that share. That will tell
> you if the cred is valid before trying to open anything
> else.
>
