Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62A1FAEFC
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 13:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DQckpxMSta0yVSEUqNdN4b36tWu+IyNY0prCToLN+6o=; b=FCgQqs/0QukgzA5i4TEK3Q9XzD
	XBUwKj5ETgFCFy2chOqIkhwsMJ0mKG7Cwkp+3l2KUryxIH0xsBwymJu2KeNpmrrAVmDgTBk5m1tRS
	Uys8dyoNb2zbcL1VKIImjA+IhAe1yNeSphy8KIAWkjuiOZsymIzwiAitDhSnPqsGFaqrGt3SM+uWp
	aHQm2whrW87fRvIHURNVUzXFYuYwsbNHxK4tAy/8Vmf61t13j0MkQqWf4Zi3bIFRJQbdZpfUsWZT4
	IjhJYVeBEdrbVeGQQjGCkhOOKRGlDTuqGm5BzfCtqbymz+eog3Ax+DE/7mHGnnTkGmOFzlkB0rYLH
	6r0k70FA==;
Received: from localhost ([::1]:27852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jl9am-000dHh-9y; Tue, 16 Jun 2020 11:17:24 +0000
Received: from mx2.suse.de ([195.135.220.15]:43980) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jl9ae-000dHa-E4
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 11:17:19 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C412AF73;
 Tue, 16 Jun 2020 11:17:17 +0000 (UTC)
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Steve French
 <sfrench@samba.org>
Subject: Re: [PATCH] cifs: misc: Use array_size() in if-statement
 controlling expression
In-Reply-To: <20200615224112.GA12307@embeddedor>
References: <20200615224112.GA12307@embeddedor>
Date: Tue, 16 Jun 2020 13:17:11 +0200
Message-ID: <875zbri7k8.fsf@suse.com>
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Reviewed-by: Aurelien Aptel <aaptel@suse.com>

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

