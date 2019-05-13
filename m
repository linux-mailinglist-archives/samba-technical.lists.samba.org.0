Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7F71AF11
	for <lists+samba-technical@lfdr.de>; Mon, 13 May 2019 05:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=E6zH3rJpOG2G9q/vDVwaMWN709ZMLluSnHCpIz0x0P4=; b=kpEZEc5y5nqvwOwtqeKOrTj+Xm
	Ee1XpFKjJ1XkeAvc7DCA92Q2RxfbP2lEhPe22bZGiIip/iaHEcJIzVPjCti0bMVpkdL5kETKgYhD6
	AaM3yBk38WB+DqBYZkHjyP1dRfSLpG3BczpnpqGrNyQVjgvlX3Z6YOvGkFJWY30kM0fm4j8pUkhss
	xcUDkZBXH5HvnYjIHgF1z5BSz6fxlr/vkJPBlPzp72prTcRTXjaxbw4no5wxG4BBnikdkTLH2PB2a
	JQ1jRZngjthV37j9P2AVnYxDbm+V7QDjOmt4zkvDG3To3Jeb+98iuEcYcZYcFb52CLHcUXSFmb4aj
	oj1XYVKA==;
Received: from localhost ([::1]:46150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQ1L6-003GV0-3W; Mon, 13 May 2019 03:09:20 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:40400) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQ1L1-003GUt-JI
 for samba-technical@lists.samba.org; Mon, 13 May 2019 03:09:18 +0000
Received: by mail-oi1-x231.google.com with SMTP id r136so8238403oie.7
 for <samba-technical@lists.samba.org>; Sun, 12 May 2019 20:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E6zH3rJpOG2G9q/vDVwaMWN709ZMLluSnHCpIz0x0P4=;
 b=hs/+/wFimgPi29+s92M6trZ94IUPx3svsEhqiBZzMqUL4S4XeBNQ632ygMi4eapVN7
 58b8CZ/H36RnHOdG/FoYCgogzumCm8Ln7zC3LLfSNX4zq6oWUmPSHJB/79GiAZJ9R+J3
 e3sIfY9iuqpt89TKTAtvkpoFHuozsMWhg7KdvSPg2c8AdJr9AqkNd4i2NDvsjhoFcEWG
 HgKLUOuDfpGPWrCmNl6DnFCeRYS24/RJC+TWoy/HUE1qC6jVMmmVnTX/0UWLFyDq52pV
 HW2JYltbBh7Ma2FRo8wQ6KKXQXytpTga65c0im2UPLDKJwNR1RDbEsbV4uaI7GuTk0G6
 l+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6zH3rJpOG2G9q/vDVwaMWN709ZMLluSnHCpIz0x0P4=;
 b=F5lL73QWcyYqrglxoUl8DinSW1jJsLt3DBr05aRVLS0mJkBFx1/k1pIzcC4UO4GAO7
 2Q08lvP82Z6qJLKEsXzCOCkEkPEDFhD/V3jJSIFgUJiAJthAvFNbMIpTfSYzvm8shQ+l
 xpTNkj/4k6gMRM/brhFl/8ukAH0dMdZTjNYuTUXIdHbOYnzpfhsshoPafKTE+6QFfNs4
 i22YTFF8iYQ5NEzWUjpiN689soLVBtx5JlxYDZdP/afNKXFbOCRMdW5w3RYm7fNec6Ha
 UNYY2caSh0T8FGwjQEJtK/Fo7ICu5ZgnhZM/wAledxTwQzvgv+as76AYueu4N37uzJ4Z
 akAg==
X-Gm-Message-State: APjAAAVS8cmpxeAPUHYR7tPrMDntedyDVcF1Md+R1FLawnLiYuxywFmv
 v8U/yCOffg1EmEWDfKrnidt6WKEB3h6CxfSTk/Nihw==
X-Google-Smtp-Source: APXvYqwDTpw8/u/Kllz79cgsFE1feIk0D9xCMmv3br6IdIsJ47n1VVSkXsnBZ47BCQzx+cDLUpvbk8anWzwM6XFjflQ=
X-Received: by 2002:aca:4781:: with SMTP id u123mr8304392oia.31.1557716952869; 
 Sun, 12 May 2019 20:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190513102627.299b1c0e@martins.ozlabs.org>
In-Reply-To: <20190513102627.299b1c0e@martins.ozlabs.org>
Date: Mon, 13 May 2019 13:09:01 +1000
Message-ID: <CAJ+X7mRBSahEWmhcoP4HzrCDkXWz=1SNA=Nf6ONt4PV9rBTgVg@mail.gmail.com>
Subject: Re: PATCH: More CTDB test fixes (bug #13924)
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Mon, May 13, 2019 at 10:28 AM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> A couple more CTDB test fixes.
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

