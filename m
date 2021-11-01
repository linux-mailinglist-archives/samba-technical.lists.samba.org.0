Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455244127D
	for <lists+samba-technical@lfdr.de>; Mon,  1 Nov 2021 04:49:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lrUWKsi8zXP/xzHOi/vZ3OrQbx1sA/k4R1IyB1yE2HY=; b=i55fx8KKguL6dJXmqng7xNHRVs
	atibeQ3MAjUOgx1PPO5EKSam8wv6yymo0eU9ihl9m05abZ04Zib19ujOCF4SHmGpjZ51vppoD2wIJ
	gMWQHGHMZp/ebhVeg6+dFshU76eH66Fg8N6QQC6v5AULo4eXz1GOg+mJLE+7Q6Cz6/awPyBalDATd
	l6TkLM2n5Hd0jy1RIUI6FWhhq9offW95GTiBRPMTRGZyZfMjk5w2BtwSwlv1C6aBCLv7VEG9yvZo3
	O3PYabVXMsJdoEIWKyJFCITp00vJsAO1CeUrJWJkWOAeMuY/Oy1ZDEL1Cx1skYxmRgBzzUAqx826V
	JAUQz8zQ==;
Received: from ip6-localhost ([::1]:31646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mhOIu-004TLN-9c; Mon, 01 Nov 2021 03:48:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57012) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mhOIm-004TLD-Rr
 for samba-technical@lists.samba.org; Mon, 01 Nov 2021 03:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=lrUWKsi8zXP/xzHOi/vZ3OrQbx1sA/k4R1IyB1yE2HY=; b=iZYHcMh8KPsO7NdlCO8eQtccUx
 Bo50wCKuVCCQLS+wGdGzBBtHJfXqhkW70XatnXln1VmGwhRIBG+vykrOgZwNQKGgReZNiiUG052Vm
 b3a5SXsQV3ckXh9l4zVXHGdwfqt+J3HlrD4Puuj7sx/5JDPgbb1HyVgOL7MipRe/SDyCtJ21rGHlW
 +9plqrZwH22pv2UOax0e+GJcNurgWD6Jjtd/g4WVMqKMpkfIKfXv8/42VTssxzqxaRorzaq0emNno
 RqfCLT/uJE6k8v0iYHocq4U+Kz80CYZCtVAe3Aip0CWmEehq0JJbZ99Du5O0ZIy5jZ0i4aASsuEd/
 vxM1zEOZqB2JPnKUadDen96alLSZsLkZD0TH3eRiUZl27G+zAI73PdENx9FPXRZoCO9PnoOe+iuQR
 198VKQNCiFaQlbKMfCJY1TOowfpqE+vLHJGqFF57FTjhxRV1mpqlOpBZyNt3/NnTV6PBX8yNalDP9
 JKMQ9pV4P8QwYIB0qrM+qQQ8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mhOIh-004Q40-Ee; Mon, 01 Nov 2021 03:47:59 +0000
Date: Sun, 31 Oct 2021 20:47:56 -0700
To: Steffen Kern <kernsteffen1990@gmail.com>
Subject: Re: Samba name mangling change?
Message-ID: <YX9jbPMn0CO4QidE@jeremy-acer>
References: <CALwZj3JLO3iRDkgHeHtUpYo4j7=Ck8eo+egAu0s+LTsny4o8TA@mail.gmail.com>
 <YWB+RusAvL91oAfS@jeremy-acer>
 <CALwZj3+TotL+bchNpX1Z5PmZeF9c1LuNOGSziD9sN-BNgz5MpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CALwZj3+TotL+bchNpX1Z5PmZeF9c1LuNOGSziD9sN-BNgz5MpQ@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Oct 30, 2021 at 06:08:15PM +0200, Steffen Kern via samba-technical wrote:
>Thank you that helped. Unfortunately I had to realize that since version
>3.00 mangled map was disabled. Is there a way to enable this again or
>another method to make e.g. *.xlsx become *.xls?

Not that I know of, sorry. Mangled map is gone and it isn't
coming back :-(.

