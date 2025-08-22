Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E290DB31FA4
	for <lists+samba-technical@lfdr.de>; Fri, 22 Aug 2025 17:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sAZ+cQcqUCqmqi8K0hO7WDTHG2Q0d8FoUUTPdwNLWSs=; b=qN05mo+kY17OL1zlsryH6fcKl7
	sY9xbT/RHh9mVKPgVsaAbTeHw3U/SLKK3ZS+tWfYYXm4HNHYF7JbTKFGHdXIsczxvFUAMIWdaqrvP
	6/kx8oZD5eTG5NOdUwUAa0HgwW3jB4lPx3eQwR867RToND5VY463zHqMVLrQS+B4lLRSVrJh7FFZi
	XWVRyrPm8t0cMB8JGxAeru1X0/HxPfLdhgGHP0CPwDfoE//Sigoe7x+ST1r89bFVeykf/dwoSoLfM
	mg6ipLDrOTxZILGJqQIaa6BkX6htqay3NhTCZ1uF/bBe49aAz9XXDt9cQsYl+oQo5NT24XGIpv73g
	fzUH3IAw==;
Received: from ip6-localhost ([::1]:18650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1upU5l-0009qV-7r; Fri, 22 Aug 2025 15:54:13 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:56489) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upU5Z-0009nA-59
 for samba-technical@lists.samba.org; Fri, 22 Aug 2025 15:54:04 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-70d903d0d0eso13349816d6.0
 for <samba-technical@lists.samba.org>; Fri, 22 Aug 2025 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755878039; x=1756482839; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAZ+cQcqUCqmqi8K0hO7WDTHG2Q0d8FoUUTPdwNLWSs=;
 b=C1aWBNudto3k04CF5gG2h/cETA4KycruVwWls1mxRcniF4Pbh6SyXnGUU2bgQgJ/Vl
 PbCUW21U61tSQueJxfgyrfKlaIP57lW29arWeX+wGPF110QtWrogQBDhhz7asQ4lCpmj
 vRG4bFV+KQ7RMPQY538Ge3Ym+lhoPRB26rhTmPy8H37DTraHjRFMZCG3OJEIjpn875uG
 1SwErDnUNR9v59ob+9dakN4eRIWrXnhMYitzTtL+/6C+v8JHGo9UOcnZzRJf6XcCVHY8
 wq46a0rF6dKBCuPP+CKd86MqL/o+rDNpLwyrjse+UsQBUs5zY1aUsARaL1maO/1LPDDp
 y7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755878039; x=1756482839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sAZ+cQcqUCqmqi8K0hO7WDTHG2Q0d8FoUUTPdwNLWSs=;
 b=foO0jHKV9QZbuC3tcNbJ1tYI0qhW7kFIcqlQdAxov3b0d+BqLelBn1xkxQmaJns/0y
 penSWIvng0QPR2iulF75kGinc81w0zddP3lr2keTbkcX5vzj14Hmo6Y1BI2uyM6FSPI2
 wHgCvf6QCuGzZWDhHZ5ZdZJoKogrRxzCoGUkV01UhMSiLLkVUF5jQdfYmIhXQ1scbrgg
 GO98Hx4M2a3jv73HkQRLOqEsb/0Z0XM90NXkbNIxnNc+7mQ4hxj3KzpajvAY6iTpJMMj
 Dbl7lXMUw8hPhnMQnPZoidJCwCt/tamFLW5L6EnE3gVdBGw1wrnJg1ReHk1bswHS9Wsv
 NNNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUweNrW7gs2s8D0VpLgWWyjtxhvaCQaNEln88qnf0+iW07ZHb/k2cYxzUDuWltNzHGGyy+r50MynPA2pCSABS4=@lists.samba.org
X-Gm-Message-State: AOJu0YxL3IbnTv5l5WfTjnBbDlIZRhVN9yiGIjnP5FKE4ybfQO07wjmZ
 HYQGZy/SUXJzBCgJuIY7hGthvfpTX7I7p6M7OyG50mZ1HZcVqKYgxyoMsZ90YHhzmc1PcOoa7Ws
 b5ic9ZCJUddEM3jXbzMGWXAuyTDtqIa4=
X-Gm-Gg: ASbGncuTuudVFTdpZG2G/yNfVJlZxtX/guP6vgUhWEHJGTjgXv2ygQAViZGcWiUHBhU
 Zie9/YcoLR4OfSQOU4ITxdCFggtoBV5O/ReRa+KzEQqFKW+hBk+yPZxIW1UaUeuw5SSqbblGUbR
 d30YT0gVsK42erMqDROTOT49ig6jcWUZcP5UfohTNJkV2UE8IqRRGvMKAUGOFN3Tzl5guQ/7BEk
 wjISKEdk/V8dD6FANV4uckTqu4VgFiWDcbi+7HwRwa5eXWkjn05mHMZFe0eWe+CwbzcCKwG4cU6
 iuXq/WjbfRX47tUA1cgW9Q==
X-Google-Smtp-Source: AGHT+IEvc7DfOpEVc+oppTtjkQmp96M4VlDaMe0nUOyRAPOE+w5AKnmsOikowDEm53b+mCiRQzM78rNXs72qB6OJL2Y=
X-Received: by 2002:a05:6214:4114:b0:707:bba:40d4 with SMTP id
 6a1803df08f44-70d970b2a71mr41984446d6.11.1755878038877; Fri, 22 Aug 2025
 08:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <c2d9d516-d203-44ff-946d-b4833019bfd5@samba.org>
 <CAH2r5mu_Nm49VaLDvBA_n16MivzUojBBZHwQgS-JNbvL-UsMOg@mail.gmail.com>
 <bff94baa-f71f-420b-b679-b4466e3d3c2e@samba.org>
In-Reply-To: <bff94baa-f71f-420b-b679-b4466e3d3c2e@samba.org>
Date: Fri, 22 Aug 2025 10:53:47 -0500
X-Gm-Features: Ac12FXydVgoz463ob875Dtv48Ug17rHtdLrw3qFGCWY9wDda7Dgc2j2Jw8zJnd0
Message-ID: <CAH2r5msdfD=edFz_9EHh6C=Ya8MdGi+G6nLX3Zx5MaSYuxVWVw@mail.gmail.com>
Subject: Re: Current state of smbdirect patches
To: Stefan Metzmacher <metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Done. I have updated cifs-2.6.git for-next (ie client changesets in
linux-next) to remove the pending smbdirect ones and also from
smb3-kernel ksmbd-for-next (ie server next branch).

I will let Namjae update ksmbd-for-next-next

On Fri, Aug 22, 2025 at 9:57=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Steve,
>
> can you please remove my smbdirect related patches, which were in
> for-next and ksmbd-for-next-next in the last days.
>
> I'll post new patches (most likely) on Monday.
>
> I'm currently at the point where struct smbd_connection and struct smb_di=
rect_transport
> are only used in very few places...
>
> metze
>


--=20
Thanks,

Steve

