Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E363B9CDA
	for <lists+samba-technical@lfdr.de>; Fri,  2 Jul 2021 09:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=A4ojUOVXY0QiO0RIKtZgShMe05vl83Q8AU6oTvQsfuU=; b=6SWdz5z6ZWNUj2wBdXtQOJUBLi
	IBLSl5OIB/bq0KoAJtClnPsILN84vpkibuzMMWcZH7DJB4UkvWC9JOQM+jv2vZdNh3rjqRsYlsDsU
	W6WzHs2Bw5mzZqe0wYOWMK2PlbS015/cJZiOom6x3Z9e6sJFqp0V+5pBgY5D2DZs42Z/O+ms7b9Y+
	DlBCVLGdn9mq+Mzju6ti41f9SxMRk8LbxOiW5d2rqUQVBK/r3gwlUvWvs6+3sUDtUVn4hYqk6FE8D
	mXXapo8vIQaVD615HKbRXBgpfnGcuOwG82kcbZXsy9Nh2PABHgT0RZC3BZBhCSWpkvC3QalVYMtEF
	tBIVqOWA==;
Received: from ip6-localhost ([::1]:23966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lzDT0-00BjbM-UA; Fri, 02 Jul 2021 07:20:03 +0000
Received: from pluto.hosts.bitme.ch ([178.209.51.11]:59588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lzDSp-00BjbD-DX
 for samba-technical@lists.samba.org; Fri, 02 Jul 2021 07:19:53 +0000
Received: from authenticated-user (localhost [127.0.0.1])
 by pluto.hosts.bitme.ch (Postfix) with ESMTPSA id 2A5C34B1F401
 for <samba-technical@lists.samba.org>; Fri,  2 Jul 2021 07:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=znerol.ch; s=pluto-01;
 t=1625210388; bh=/igXPRDHBdEYRFO/26lJ3jUEW4sIlA8JzdRVw3J6BdU=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=qVIHShfi0obzocr5OMysJys5e4LBy5eSGOOQ/osZQOhsBOIB6KabMVUsgrUFS1mWr
 NVQG+YYlAK2hfHy20LHB9/2mIY/LkleJt50yiRnfyKzmjTDynxOxI6KfXEWN3czLNf
 q7FQ3svY8wtgwY6KZfuFVoEkr8j+U4cre+ic9sWF18AsLggsVylfOCypBxLArnwBKO
 N9ye3MTkly+VbjDwH+kiOFy5N9zN9jmfIw9Rg9FCEcsZy5T0YGElDkwBKCwfa7Zbl3
 hYiZefvn87JJjsh7A10Ut8AxbwDgIMilwQHFllgaGwTYm8VQFWIKGteEC8rfDPMNhw
 JQmSi1zz0l56A==
Date: Fri, 2 Jul 2021 09:19:47 +0200
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: gensec_krb5_start() fails silently with tlocal_addr /
 tremote_addr is IPv6
Message-ID: <20210702091947.23f6bdc1@bonemachine>
In-Reply-To: <20210701220727.76fa9c60@bonemachine>
References: <20210701220727.76fa9c60@bonemachine>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Lorenz Schori via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lorenz Schori <lo@znerol.ch>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Thu, 1 Jul 2021 22:07:27 +0200
Lorenz Schori via samba-technical <samba-technical@lists.samba.org>
wrote:

> The function gensec_krb5_start() returns NT_STATUS_INTERNAL_ERROR when
> tlocal_addr / tremote_addr are IPv6. 

It looks like commit 43c808f2 might be the culprit. Before it used
sizeof(addr.u) afterward sizeof(addr.u.sa):
https://github.com/samba-team/samba/commit/43c808f2ff907497dfff0988ff90a48fdcfc16ef

I suspect that this should be using sockaddr_storage instead of
sockaddr in the first place. This was indeed the case before commit
a8ba35fa:
https://github.com/samba-team/samba/commit/a8ba35fa97bedaf6161978f7b15121ad6a293643

Cheers,
Lorenz

