Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E87A84C31
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 20:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Y3GAObyOFGSDS+Xw4GgXyeEFbO2rwufo1uCKvwkNg80=; b=BYzfaarj62favt0J2nfGX4heIm
	9pOF+o6Q2yWgifAizwIv3KDMuRiG2QXw0qvQEOaPROKsZ03ABBaB8q+o6k2R+QGC3MKRvAAr7tN6H
	ZBdsHMQpIW+I3DGd8BKtQ6mJiO4M2XG7Kd8fy6jdvdwUtA0eVmONw2ZqyQ2/YP9bS4fYcoUfBgbj+
	Zl5bfvHjroC1PTJZY6Vv0Ns+9T/FQ9nslVFQXW7HAFDewxnOyqjwjzWCgQO3jm/I6JCg4pPGFxjBt
	WUmbCIbLlJ9j6pJ1KWg/yRyES4mjbClt6K1z3Y6zrsjDNdod36HvM6ceBmA9rfxDm7PAKW8yY68D+
	2NsyXcQg==;
Received: from ip6-localhost ([::1]:29974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2wmz-002Aiq-TQ; Thu, 10 Apr 2025 18:38:14 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:61603) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2wmw-002Aii-3G
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 18:38:12 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54c090fc7adso1289244e87.2
 for <samba-technical@lists.samba.org>; Thu, 10 Apr 2025 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744310276; x=1744915076; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3GAObyOFGSDS+Xw4GgXyeEFbO2rwufo1uCKvwkNg80=;
 b=Oh23RG5CJyW9pBdyO6NlL8a1SzCUmN3ogrpK6eX+VYVbgDnxJ13Nn9fAtX6c5Wycuo
 6fY/5khMDExEmuPFnM78TI+Dt8iTaoUPnT8paLZIf1fzSFyj9KjmNTfynQWZZEVpl6Cj
 bW0GVnC2W3ZOPuIXQMwRn3toYxVFa2q4xU8P8vYjt6ZFO6SxKkQT3t1gOjxApWSWjqsx
 Eqa4nU8+XuqoGjqACAwkqshfU9KAVz47mFAssVzKo1jS6ReEBL/WYHLsBfPISpHZoUs8
 xyjz8uxSdZE0Jq7IXvWLmYbW0VBqnZ/kX4btkCnu/Drlz2Q9lJ9ekeckk/TMEc3maqTu
 xtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744310276; x=1744915076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3GAObyOFGSDS+Xw4GgXyeEFbO2rwufo1uCKvwkNg80=;
 b=JCC4l8d6i8f6S8MM8png/7u8YUNMV1NfK9sWOHbhGo3MexB7b9C2rucIJG/04Kv3ht
 EBI+v3Bts5pckITYqYT9T4VYi4QYc4G0SZAV4Ujqlj9xGl2jTNzzOJAjvMyqmlVjJi7E
 zpyXHW84xGK0sijtW1xq61bEOEJ9OtvENjbcXi380bh0PUkR8IiQZV7vEMEvCmFLlN0Z
 fq/vvrl/RsxZtBoDdSV5b8kDHq6IezJVpVD+QMKgeXI6TaWPNDjlTUq7KRzn94YHdSLp
 d96KbSAqVRlNwzrLJpn6ACnHisfkuWQ8vUgEpO2E33cO/eS484jjFuTSqJcL0RLpZU5h
 18og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW+5ZYKAsMiQ4YXErHkT7/cdZEPnN3Lxuo+Ssm1HX3wDi355Rtwy8KOPfFGDYdyGfItEIzg412HYq93j8xZQ0=@lists.samba.org
X-Gm-Message-State: AOJu0Yyu1Nq51jMi80+Esp71jUt7Mesow3SPqQTV2HQozmr7hdrfXIyo
 IAX/spghyAuPjoz2+s7N583RPuNQ49al/v/EBDuw/bmRas6QK/cyDdJIgi1sjml2uSQjCH6zPVX
 ztkvTU7Iua+veFJbvKPqNoxTIefo=
X-Gm-Gg: ASbGncvOcaB/szwhHrcEQUwIdPQIlYC+X0yHmOGQHQfsMh7wQpNecje/FjrSXrrgZco
 HAziTxiaelS/S02A4/BDfgsu7Kb5UCcfGZiSKzaRJdVnfMfWSs+DKK2pBRwEdCvCpUZe75/+ZkV
 idvUDoaAsYQC6uaJNuixEJf00N3FSim0sqoqOhl+4/H0bD8HxpCbYjLr5z
X-Google-Smtp-Source: AGHT+IGIPyKwAAreodyN6vVGJbh2ZobqpBvExETMq6i7L79uNw7TvmIO5fbwHo/74cz3OO8kQs6+n54d1Qm16vW7re0=
X-Received: by 2002:a05:6512:3f05:b0:545:f0a:bf50 with SMTP id
 2adb3069b0e04-54d3c62ef13mr1371323e87.35.1744310275992; Thu, 10 Apr 2025
 11:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
 <a5c81acc-1e85-463d-925e-eb5b05af9ee7@samba.org>
 <a60852f5-cb90-4614-b35c-91d6507aee0a@talpey.com>
 <085204d2-22e6-4de6-aeec-620dba38280b@samba.org>
In-Reply-To: <085204d2-22e6-4de6-aeec-620dba38280b@samba.org>
Date: Thu, 10 Apr 2025 13:37:44 -0500
X-Gm-Features: ATxdqUGBKtzTsQKqy3ci9KeEdCz0oDkmM3tAH_MMGshL-7BoNDKgnFu-dS5gBl4
Message-ID: <CAH2r5msKR+CGgOHxCU+TfYPakQxbQJQnsVPyq6ANhSnON+vSWQ@mail.gmail.com>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Ralph Boehme <slow@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 "vl@samba.org" <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 10, 2025 at 3:32=E2=80=AFAM Ralph Boehme <slow@samba.org> wrote=
:
>
> On 4/10/25 7:23 AM, Tom Talpey wrote:
> > On 4/9/2025 9:06 PM, Ralph Boehme wrote:
> >> On 4/9/25 8:43 PM, Steve French wrote:
> >>> On Wed, Apr 9, 2025 at 1:18=E2=80=AFPM Ralph Boehme <slow@samba.org> =
wrote:
> >>>> what should be the behavior with SMB3 POSIX when a POSIX client
> >>>> tries to
> >>>> delete a file that has FILE_ATTRIBUTE_READONLY set?
> >>>>
> >>>> The major question that we must answer is, if this we would want to
> >>>> allow for POSIX clients to ignore this in some way: either completel=
y
> >>>> ignore it on POSIX handles or first check if the handle has requeste=
d
> >>>> and been granted WRITE_ATTRIBUTES access.
> >>>
> >>> I agree that to delete a file with READ_ONLY set should by default
> >>> require
> >>> WRITE_ATTRIBUTES (and delete)
> >
> > Since when does Posix require this??
>
> Obviously it doesn't.
>
> Let me try to ask it differently: do we want to relax Windows security
> model on a POSIX handle for this operation, even if we can build sane
> semantics into the protocol that doesn't require this?

If in doubt, better to be "more secure" unless case is very strong to relax
this check.

--=20
Thanks,

Steve

