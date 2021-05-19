Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD338958B
	for <lists+samba-technical@lfdr.de>; Wed, 19 May 2021 20:35:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nRGaivmRHyg0gO/Zy7T45BZ2Mfw7exCjuv7k9hESuHo=; b=j6vZlQGuo52x6ekOoeAPf9vbdu
	dS3qREqBYNfKgY1LOW9DX84wiqeg/r94A58OXDmosPQ+oEr3rAeomE3COXiFbp8/aUGc7c7GMHRp5
	iwNA80eIHnR2QJgyalh6vPAUiRKKVgHJ9ire/7Cq/Jtz4MEinvJ+7UKOlWLdMUA1PCmeQx4hCVhrt
	pzmXgiJvo4zd+mkCMu1AXBqDQIbFy+6hQ3bOgh03TRsG4ZVK4taa/KKfr3ZckjdfcMhiYkFdgmPkC
	p1pq+Pt28IoXVHE9mPFuY9LOLssvcC4V72Qm3xzx6SfIL7r0DSdj1ByqYkI7FWj7j+qmdis819G3W
	Ljx1tqKA==;
Received: from ip6-localhost ([::1]:39412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljR1q-001qic-Mk; Wed, 19 May 2021 18:34:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljR1l-001qiS-QL
 for samba-technical@lists.samba.org; Wed, 19 May 2021 18:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=nRGaivmRHyg0gO/Zy7T45BZ2Mfw7exCjuv7k9hESuHo=; b=YFCEl5irIoDPn907+gyH1709SR
 R0IcY5rnh3xXvhKwwwoBbZJidoKUFsPRznHug+d9CQijvop2Nf+gioMI5X6nkSKDaL1BfhYoxLm3C
 jZaMlCrFsHw/jclfnh/1n+Pe8aMUDPE62cmqg64CBE/1FoLhphPvvXHtjtT9Z7FSVIagjoeVe21DX
 9JoIF+ud+eVdwTCR/aRXmKSk4pR0xjbq/mk9wpewpG2h6BG1Bl2/DHVCwFpSdyg5jbtviwPYLMgSY
 ZE48znZx1GboDMlAOSYwi6BgYv0f7v+k/4yvx74r86bI/sP+WcoqLDTCZNpU1hythvX2MFEsRoCU3
 UY0TbwZ8IhXkcrwuBOxCK9PXLMdhZL3GB7aqm16nDjnInSxAXoYze+aSyx7T3p+9bL8tAsXU0lcHh
 L8UlpK+Vmw/N1p7hV788Huo0CZ6nRM4FoOMz5HAdd25WW7U7520OSCKYAW+FaXbRXXbQmX6Q5wMce
 tpnONjpBUU05P0wNJeOkJEPh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljR1k-0000a0-G3; Wed, 19 May 2021 18:34:40 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: Offline logon flapping in autobuild?
Date: Wed, 19 May 2021 20:34:40 +0200
Message-ID: <1923959.sGxDyq99xp@krikkit>
In-Reply-To: <afc6730cd40ddeff92db1fc82b0aec32f09d85a3.camel@samba.org>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <a7020786d9a620ea18f686fe4ac2c5d6c0a4b800.camel@samba.org>
 <afc6730cd40ddeff92db1fc82b0aec32f09d85a3.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 19 May 2021 04:10:17 CEST Andrew Bartlett wrote:
> This patch seems to help if you are "abartlet" but probably not if you
> are "bbaumbach" or "mmuehlfeld".

I think we should use a fixed length for the username, either short it or add 
a padding so they all have the same length. Then we wont run into that.


	Andreas



