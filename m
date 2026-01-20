Return-Path: <samba-technical-bounces@lists.samba.org>
Delivered-To: lists+samba-technical@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKQ5Agukb2n0DgAAu9opvQ
	(envelope-from <samba-technical-bounces@lists.samba.org>)
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 16:49:31 +0100
X-Original-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9906E46B51
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 16:49:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bzkfotPOvWHcE2VqgYlqDYWp4nEzKeKm65QBSmSooao=; b=3Z7Mzo87A7Qd0UeosAxKv9f2pv
	/bG74We3lpjh8KfQ5J3+w5MwVq1wdBhJg5Z3CwvGkO554pihjPXyiUeAwKf76b4nEdhXswQ8BKxet
	gczBZxUymEzhD5W4A94FTpm6vufv+XMo16aMVdhIGb4X1R7SVHjE0ueE12p/NKM37S97kmoYN/ahe
	ew9FdrTa5srWat1/O+GeCHTG1HkyIvkTKcBLfXg1zjI267veTVfvUshQryge6GgsATeeggCyLfX/K
	hGjUdzJUoK3qLKYDcrWb9uylWvRvwhlQIE2VakyqREPRvs3UqIjOZpe8r4x7KUzaagMTbCEst/I9h
	XG0TYVRg==;
Received: from ip6-localhost ([::1]:60566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1viBhg-000jRd-SU; Tue, 20 Jan 2026 13:23:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:36554) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1viBhc-000jR8-E2
 for samba-technical@lists.samba.org; Tue, 20 Jan 2026 13:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F114A419DC
 for <samba-technical@lists.samba.org>; Tue, 20 Jan 2026 13:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D26C16AAE
 for <samba-technical@lists.samba.org>; Tue, 20 Jan 2026 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768914813;
 bh=bzkfotPOvWHcE2VqgYlqDYWp4nEzKeKm65QBSmSooao=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gX6Uoe3Tdfu7asCIBzCm07LhcH7jZyee+euPRrobsECY8twYS5xMUmgLk1E9BCrD2
 5JQdXWb2QoI0BM9DRtNXubiS7yFhoEg9pCOjyXj1BbcvcEQE/1zio6FCBiqOGxFL39
 6DMp4r8qAdajShd25zY0twPuNPvWIauEyMSGwaNu1dKlNmLNFCJIUYXj3BkWtfeUB/
 vW38Kd92SOXa6Hv/vCMrVJ1ILidlyY/WutigsCj6yf0WFMA2mt7rv6SS8Sbr764Ci7
 7f46pwNPwF8SEoGRISrwtIwaV3Tu/WdUFAY7IbtIUP8xzI8DPJxjuSh/sF74m+piWz
 hoimlVsI48G3g==
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6536e4d25e1so7962386a12.1
 for <samba-technical@lists.samba.org>; Tue, 20 Jan 2026 05:13:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQG8LWMbPXeAIxnK5IoA3tX0ejRsa3dMdL/OnEUxgS8ysBEgZ6ruRG/JZBKjcZdfbw3DBINrWmXkWkFgoDh34=@lists.samba.org
X-Gm-Message-State: AOJu0Yz45Vpxru2KNCRBF/U2D1xEgoLcE/5F/ExCTx2gXXt0hYORtIcF
 znCWvgFcj5mlKYmidp7fIG9M/jlh43jyjE0vUKZb2xHS/rtX+V+YT7LjIRGhdOAxrDjIc9/W63v
 t+KqGzniMTpjuZkGi+im9fV8l9LPWPnE=
X-Received: by 2002:a05:6402:2348:b0:64b:7307:9b00 with SMTP id
 4fb4d7f45d1cf-657ff2a6953mr1629238a12.5.1768914812500; Tue, 20 Jan 2026
 05:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20260119174310.437091-1-metze@samba.org>
In-Reply-To: <20260119174310.437091-1-metze@samba.org>
Date: Tue, 20 Jan 2026 22:13:20 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_vHZuewx53Qthz41sF7EMg_LP68V7+89nwxULwh4WGFA@mail.gmail.com>
X-Gm-Features: AZwV_QgbnctspUoFVMpm-bxThkzx72hvyKXJEWeGpz7h-FHXQcMgyUZxvpSWLwQ
Message-ID: <CAKYAXd_vHZuewx53Qthz41sF7EMg_LP68V7+89nwxULwh4WGFA@mail.gmail.com>
Subject: Re: [PATCH] smb: server: fix comment for
 ksmbd_vfs_kern_path_start_removing()
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, NeilBrown <neil@brown.name>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.samba.org:s=2954282];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2a01:4f8:192:486::/64];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.samba.org,reject];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[samba-technical@lists.samba.org,samba-technical-bounces@lists.samba.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lists.samba.org,talpey.com,gmail.com,brown.name];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:metze@samba.org,m:linux-cifs@vger.kernel.org,m:brauner@kernel.org,m:samba-technical@lists.samba.org,m:tom@talpey.com,m:smfrench@gmail.com,m:neil@brown.name,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[samba-technical@lists.samba.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.samba.org:+,kernel.org:-];
	HAS_REPLYTO(0.00)[linkinjeon@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[samba-technical@lists.samba.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[samba-technical@lists.samba.org,samba-technical-bounces@lists.samba.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[samba-technical];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:2a01:4f8::/32, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,samba.org:email,lists.samba.org:dkim,talpey.com:email,brown.name:email]
X-Rspamd-Queue-Id: 9906E46B51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 2:43=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> This was found by sparse...
>
> Fixes: 1ead2213dd7d ("smb/server: use end_removing_noperm for for target =
of smb2_create_link()")
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: NeilBrown <neil@brown.name>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
Applied it to #ksmbd-for-next-next.
Thanks!

