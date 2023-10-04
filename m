Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F397B8635
	for <lists+samba-technical@lfdr.de>; Wed,  4 Oct 2023 19:15:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uN0/qBnSOCxuRcuMfH57mhCtCNdVLTpuCD2AqgTf59I=; b=3aloV6T+EkEsv9vfOBSjVF0YGe
	lYJVhyW8f563X7Qq9KDYQzJn4R80ghyQHPy3isAJiTyRazByxJiZ4oX6GTMxm5IAr1GT8cE4JFfoM
	tSFjkn82aJwglKY9l5RMjOU6bAooqKzECEnjeaDz5CZaLnPLDK9KrcNUTOy36NvPyBea9lMV1baS8
	kQ1lYAqMQdk6iMczPWXMwQrZQsYrRj4Dv71tAEgjUubh40xY3Q4ekkayyW6mBIKdq/CocZ9wQRxCs
	+Iwe14mmLEBeijB2lx6wwn8Wy6+M1SRMlFwa8WlkFsfgE7Gtq+fVwflmuw3BFv3IyA2gywZS4R1pc
	P+mr9sbw==;
Received: from ip6-localhost ([::1]:38062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qo5Sn-000NFf-6X; Wed, 04 Oct 2023 17:15:08 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:48534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qo5Sg-000NFV-GZ
 for samba-technical@lists.samba.org; Wed, 04 Oct 2023 17:15:05 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so83579e87.1
 for <samba-technical@lists.samba.org>; Wed, 04 Oct 2023 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696439700; x=1697044500; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uN0/qBnSOCxuRcuMfH57mhCtCNdVLTpuCD2AqgTf59I=;
 b=XyQlfzQeIRsP+c8S5PxVSjD3maNjVdbfVOUN1A+VWKqZUZt6/+bsGFbd+EjeXSxvMv
 RRv8m4szOhpUY9f4VEEXgIHv6871W5/W9Fmju4Ydsxhd44gnkJNplqSkKoEyTGChiXKp
 uM+5xS+VHoBSABQr1pFU+PVqd50dabdxTApz7WjP5h8ZDnkRmq72hxhPb3ROtQIkj6VY
 vlF4zgKG4gzKd7H1Pt7HwtYt8GlyEeCNrnWtoCEgxrPKPPc0eotbDZKSL9hb2Vk77aMG
 NJlck5ykfYuKKOXKLnI9NM99ZB7VRtqjdC80Wod5L84ttMFxBWvPQlPi2MCi/avhjwBc
 DMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696439700; x=1697044500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uN0/qBnSOCxuRcuMfH57mhCtCNdVLTpuCD2AqgTf59I=;
 b=o8/3X7SDC1xGRvuET8RDZtn88sygNZrggOYLFz05lQeMDbKjxTP5FDdcTcSzc9n9WC
 aaPd1TSjPKY+1YWp+F30VZEZVMenwPcKyGva8pq6DNCtfJoCRLTx6rddA4AnziuCy/4E
 9r1MbJ9RK3BBsc1yVstuaJgQuA09cocMQhgNMknxoA//AnlR3eYnQhawPHkIat/zjWcx
 NZxaplUVuiPIcLk6ZisJe3LG9T9tfvYBIHsbkkCMpMGGVG3vm/FnS0BbNQxY1xRr+TaC
 iU4SzP0PIgDHjTF1Vsg9cu0ktrum9l6KQrw6NojCLRCZw8mnh7hj3+lBB343QH9es+pD
 F8sA==
X-Gm-Message-State: AOJu0Ywc/p4cDZIVLUkpxdVJpoggfhP1hgFX7xcjoiSCYAp3+rRY14be
 QGJc61IZubhb9y/akQDSoui6R0vx7Qhv7HxqYis=
X-Google-Smtp-Source: AGHT+IFaH/fFdbF+DkwG9xKZ0qeshMs9vxr3MPhrVxX7QwoI5Tx/rsMu4nwy0PRPqeHlT1Zml0o003d7n/XjVoIND9M=
X-Received: by 2002:a05:6512:32cd:b0:4fa:f96c:745f with SMTP id
 f13-20020a05651232cd00b004faf96c745fmr3011246lfg.38.1696439699819; Wed, 04
 Oct 2023 10:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231004011303.979995-1-jrife@google.com>
 <9062eefc4114f9c9162a19f98a1b820c.pc@manguebit.com>
In-Reply-To: <9062eefc4114f9c9162a19f98a1b820c.pc@manguebit.com>
Date: Wed, 4 Oct 2023 12:14:48 -0500
Message-ID: <CAH2r5mt4UGni0Wa2sqBA+OGuvnYjmy1ut0pzKa-1C1vUE=fEaw@mail.gmail.com>
Subject: Re: [PATCH] smb: use kernel_connect() and kernel_bind()
To: Paulo Alcantara <pc@manguebit.com>
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
Cc: tom@talpey.com, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Jordan Rife <jrife@google.com>,
 lsahlber@redhat.com, sfrench@samba.org, stable@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending testing and
additional review

On Wed, Oct 4, 2023 at 10:44=E2=80=AFAM Paulo Alcantara <pc@manguebit.com> =
wrote:
>
> Jordan Rife <jrife@google.com> writes:
>
> > Recent changes to kernel_connect() and kernel_bind() ensure that
> > callers are insulated from changes to the address parameter made by BPF
> > SOCK_ADDR hooks. This patch wraps direct calls to ops->connect() and
> > ops->bind() with kernel_connect() and kernel_bind() to ensure that SMB
> > mounts do not see their mount address overwritten in such cases.
> >
> > Link: https://lore.kernel.org/netdev/9944248dba1bce861375fcce9de663934d=
933ba9.camel@redhat.com/
> > Cc: <stable@vger.kernel.org> # 6.x.y
> > Signed-off-by: Jordan Rife <jrife@google.com>
> > ---
> >  fs/smb/client/connect.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
>
> Acked-by: Paulo Alcantara (SUSE) <pc@manguebit.com>



--=20
Thanks,

Steve

