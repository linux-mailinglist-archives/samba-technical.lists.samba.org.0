Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A78908CF05
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 11:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=H4PjpDUStOpQNTUhbTdX1F8Ph5RLXkqqisfVdDVqXas=; b=ckDBX1ELxd6k867Sh/pAdOYTWd
	IVfr46fQr6to/uZ/oXsGo1JvZBjxx9kfVrMyERzgMNOAak9+0fRw49UVJJcfbW5aPs/tmc6BO/BAs
	iOkI7ZiNRk0AacFaKmCq4TdiI/9NHdyozS3owDkceJwOCaW8nb95IdeSNqPLuHWKBbQnBjWoDDaHr
	wJUQ9lS3XT4sU+ZHdY4tggWj3E04c+hQNUVaElj+fsijvULwq4KTnk+b3bQLVrqQ5ROW1BlEmP6U2
	vOJzP+9hK2B2KrfgZhzCULAh3iIbU/56jX1/UU1Q5/k8si5Asvjo7MrAeRamjfYX+M4mn0NyZagly
	QN8nl/jQ==;
Received: from localhost ([::1]:46932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxpFX-006Fez-5n; Wed, 14 Aug 2019 09:07:19 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46464) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxpFP-006FeE-CP
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 09:07:13 +0000
Received: by mail-ot1-x334.google.com with SMTP id z17so62205261otk.13
 for <samba-technical@lists.samba.org>; Wed, 14 Aug 2019 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4PjpDUStOpQNTUhbTdX1F8Ph5RLXkqqisfVdDVqXas=;
 b=APwg1p2WaKLAG8BuC40EmuUSBz8sBvNIL5CMUlBXe/T77E0QXwwnrlnmwqUfPaakZt
 n5RLGhkKKLphX6bsDBb5QgXasPg5UewcJKbgrF6wf4aWUYvz9w+rmDOgplXTzCnh3N8h
 1jWFFhjmltFhTeCmqnh/rEwVi0h5U1sLG+beqlftQM46zOMlO2Lyg60HA2q7bfLjPsW4
 BAtE+CcgKrvyj0Pj1tumuFHO8WjR+xWuQpzlS7zL5M98AR9NAge6C3n8/Z/ccA2RoF0A
 uNmqGu0OXcYfQIL4t5Xu9ErWvyC50jUTCuXmpVD2VDTOwYl1oWyzsnzhIOg8gwZHINCN
 w8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4PjpDUStOpQNTUhbTdX1F8Ph5RLXkqqisfVdDVqXas=;
 b=EHgEUcLge/w2y8CPn9bIAm8VQzSzfz6DOE0ha25G3xoLpkYiKUCmdCIpeMAgP1LFmS
 tp6gZ5rxJyKqjh901CPt93SpdRmOMFwK30FifwmWMKlCVcbuwmZH4cKu/HNnlqq0yg0P
 36hUnF57rSLPglPBx6ST0jRBkPVx7NYj1Lh/0k00MldbhMAhe5Be3oMYSNyhN1BtCJQo
 EGTGmmMF0e8kpvzBNiHVMG7THQvAqO6H3AvVCcpYQdUypJP7YyI/6Gmpp4DppcF9nKIA
 bP5lL6blkmEKxfvKzPD5QKNBmRg2xHTQ7Rq6RaXXGAu2oOQDggeKUNds7oGGZG23QGyp
 5SJg==
X-Gm-Message-State: APjAAAU8pvEGo9SILqBC9WKJmDZFMsBx9NpVJ91drQ+etQnc1mwAnlUE
 lmzbdIVgpoh9d2XuKpPVYCUQF82D2XD2V+Lzv6qycg==
X-Google-Smtp-Source: APXvYqwK/MNxD78GLWS/3+DKLwW4z96UqO6NTxMkovT8n6Bln/O4VjYGWHGUesZMcdkRX5kWyaFZRB3PDMVaezAeCec=
X-Received: by 2002:a9d:73cd:: with SMTP id m13mr5040182otk.43.1565773629264; 
 Wed, 14 Aug 2019 02:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190814140013.75102664@martins.ozlabs.org>
In-Reply-To: <20190814140013.75102664@martins.ozlabs.org>
Date: Wed, 14 Aug 2019 19:06:58 +1000
Message-ID: <CAJ+X7mTpZgZVMY+GowPaAT+OqwEcqXKpab51zVaoyeOHXH8Nkw@mail.gmail.com>
Subject: Re: [PATCH] ctdb-tools: Fix usage for "ctdb cattdb"
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 14, 2019 at 2:00 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Minor copy and paste fixup.
>
> Included in this pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

