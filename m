Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C68B78B65ED
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2024 00:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=B+nn7rejfSMOi9pnyXQlF9+lad0HzqS+xk6hNvaRABg=; b=mDgkOVgVenJQ8pGYDPqy0PKtll
	5gUegYq/1ev+ZjTiA+B5kIfN5NKh+jknlo+KRnIcIlQq4LBDQqDX3fZqxUt1b3Ouj4bwZDO1K+ZBQ
	Gv86I82nq7Fc5X7FQjD5tEqxt3770VCnF/X+tbEKmGa3nriGOmIz19g4BuAgLGdgE8ZVaUuc+gyp1
	9SbtnkwcutHhpxMxMM0ww7qcWyO+3HzXsYCVNiovZFH10bX1eLGFwKg/KdsBFXh/TO3lGmJVUQeqD
	Etnbpuuugqume/3LUTRcIm7LUAk8sfBd9HmhF7MGApuHQ78+tsCErMWV3FCRQ82IV5DdyWUFCifn+
	OOMrftow==;
Received: from ip6-localhost ([::1]:62910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1ZsP-0062Jr-Ca; Mon, 29 Apr 2024 22:53:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:54748) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1ZsK-0062Jk-Oc
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 22:53:34 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2dd041acff1so58556311fa.1
 for <samba-technical@lists.samba.org>; Mon, 29 Apr 2024 15:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714431211; x=1715036011; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+nn7rejfSMOi9pnyXQlF9+lad0HzqS+xk6hNvaRABg=;
 b=dZapltywpTAc7CUGyTr6s60S/o4CvjGa8m6J/bu9AL0ROMeq9602xcaKAfruQbxNp6
 2/W/hNIrwg1dznCi+yAAMeRFFtfzwpl0wWV/187StH4UscQ7W1iyFWO8bGqf2s+K6OJ/
 PfMgAysFrWeiPHvO8bjJo6pKYqHQVeG8PRW2UkSX0jGrM1ysafQUZUvY3KH5qVBHEMIb
 geagi3TLZk4pJtu+njd/nBcTtW2GDC3QL0kGAC7W7FsoFIhhjf2ODHBamnwvJUry0/bp
 stRODnLconTdLiU/B41RLcegbKqGXZNZys5QAs+wKI0C0070KN58Y4+Pen6v9E+RWZE3
 vfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714431211; x=1715036011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+nn7rejfSMOi9pnyXQlF9+lad0HzqS+xk6hNvaRABg=;
 b=ucVN3CInq15/m4ajnOS203d8mr9wZ3s7TFYWWqCsl0F/WOctb7E6dU1vk/GL/0n9ne
 f/kdx6OkOcL/cjwt2/BR9CBv8khUrwGvm/oSX+VWbbjO9kj7uPGwY/NjJkh1+Fc3Uu/m
 VX3UUYqMOEMFUuuCAcTruaFrk4jTSU9omfPXhkpygItw4hLsvv8YfZwLwoYHnXDzZTYO
 UWCvMlVTac3jE4g96EO+DkK83gbwB3cjcCd+FtSu/lHyGBbwDcQvYFkHLGka69V17utc
 RErxeOtw7/vTPBBrpugtkq81ekiM4j4rBXMxQiVEZUB5JgSqOpm7zoIF8pAihcVyyhuQ
 njmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz1vl9q9mqQIbvtC+wx+wnMgiAwqDqkap0lEpj0WTaTo+HEe+OroVLFNaofttvK332WwmuTbDxMMwTB5QM9gvk83d0ipuDkWma9F4E6XIA
X-Gm-Message-State: AOJu0Yyoc2NXRYBlf4R7W6hG71/npfeoG1HGn/85aMjbW69IFZFbd8Iw
 rHHOnEkcy5oIijc6r9Y94Yeq+3jovwM8+hgOt46zawds3ecj0XYridSxmwIBiM9B/WYETGoHXKQ
 D5BtT4hG95e528UaypbMBqhppSyY=
X-Google-Smtp-Source: AGHT+IHSd1VtqaF5oo9Pz/bv3BQCuJdf2vBdIoB4MdeNqaZOYgV4E1kXKdlyXgvDNKRk+U1IF1mJqd669LG4Ne7VBX4=
X-Received: by 2002:a2e:82c6:0:b0:2da:49f2:d059 with SMTP id
 n6-20020a2e82c6000000b002da49f2d059mr6435532ljh.27.1714431211136; Mon, 29 Apr
 2024 15:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
 <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
 <Zi/8DEo+ZiF24LLw@jeremy-HP-Z840-Workstation>
 <CAH2r5mu2Qr5W1eUOz-JFyf4X6Wk9X2Jr4XFza4tJmH+mVVZqLw@mail.gmail.com>
 <ZjAHFSxjaYaybUSb@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZjAHFSxjaYaybUSb@jeremy-HP-Z840-Workstation>
Date: Mon, 29 Apr 2024 17:53:19 -0500
Message-ID: <CAH2r5mtacbysWjnuDUoTghxPqccp=GzQug1ZE+eRSK=UoqR_gQ@mail.gmail.com>
Subject: Re: Samba ctime still reported incorrectly
To: Jeremy Allison <jra@samba.org>
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

I tried experiment with Windows and yes WIndows updates the change
time (but not write time) as expected:
e.g. on adding a hardlink, or adding an extended attribute so not just
Linux that benefits by the proper behavior.

On Mon, Apr 29, 2024 at 3:46=E2=80=AFPM Jeremy Allison <jra@samba.org> wrot=
e:
>
> On Mon, Apr 29, 2024 at 03:16:02PM -0500, Steve French wrote:
> >
> >Another test to try is xfstest generic/728 (which checks that ctime is
> >updated on setxattr)
> >and xfstest generic/236 (checking that ctime is updated when hardlink up=
dated,
> >where I originally found this bug)
>
> Well remember the time tests are meant only to pass vs a Windows SMB3

I checked a few things - but

--
Thanks,

Steve

