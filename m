Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE6E16B0BB
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 21:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=v3z5DG6SSs9yzF8DZmGugxU+J2w73WAJ/k2SZlnJ8BE=; b=5A1YMPQFr+yrxA/aemtKgNwJuJ
	r+RJ+FGKAiL5lwgbp8d5DQJV45cZ4rv01klVzK/2dpcVPBVGeVOc8YrXoYxu/eeTmmkpH2fCgF3zv
	WbSfvXAT/cVKpeguheT3jOsuznMW/6kHU7sgb0yiqgGAWMP7UGgX4/jyAMGVTh5esr70hRL/SFIer
	fLsQojuOPtWP4oG2K79Su/upUY9GZg7vwAekeqKmqLAnIm8QXFsDgvvavXbHL+/LvH1J4GEUiqKu2
	w+hcJ+YjpyK9LfkpYEL1lU4tSVQwQKNjcdSyXAsqYuQvp41k6sq3oKn6FnxuyFHEhDSkRAVdPt9vR
	TfqVkjwg==;
Received: from localhost ([::1]:20086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6Jtb-00BTPE-KF; Mon, 24 Feb 2020 20:00:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6JtT-00BTOp-2l; Mon, 24 Feb 2020 19:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=v3z5DG6SSs9yzF8DZmGugxU+J2w73WAJ/k2SZlnJ8BE=; b=AI6926jQvJ7kvYuwM6tceL1tW4
 P71xEMwj2n6T3HKUu2SyNeg6kWTw70S/vg9pKXT7Baewy3jfZB7LsGZxx5wzEaaVV7ULDE+6F2MWJ
 F/vidwKcALgObTG2ypfyymfW0SmQjvI1MBjP3rzWf13/jzixOiPOzv1vYZJTYsXFBEpGrHHvxoVFG
 6ycGPtj7ivh788eAaC2B2oev4uY+5Pim6PWSeVA8YyzpPLTdEnTtA0FrO1mIpZciawkTqqsr4A0Ag
 GrkIHACfL+3sdD2AJDbArJUxBBq+FSm3qWMqHwys9lDNEoTJOoc+d+LPqHpgKXc0YGei7BT8PdVqP
 euhLrZ3cyxcMS43UZDUj25/T7LlDilEakk9LAunwnrb3YKPXyJ8ifivzPNhKrJTHALuOOPPTlp/dk
 KqWZFYz8eNyU+Xe6UIsD8pzlqLWk6UX9XShDz5z/99coRkNxt2hnWrK53LVubTIEvHfCMnqYoewR/
 8Cm1dgy/oQMnmhY6dYUsBNEb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6JtS-0001Ng-0n; Mon, 24 Feb 2020 19:59:54 +0000
Date: Mon, 24 Feb 2020 11:59:50 -0800
To: Peter Eriksson <pen@lysator.liu.se>
Subject: Re: [Samba] Patches for Samba 4.12.0rc3 for OmniOS
Message-ID: <20200224195950.GA15879@jeremy-ThinkPad-X1>
References: <20200219110826.GA32753@carrie2>
 <6FA00733-FCD5-4EC7-BA66-0CD047A81EC7@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6FA00733-FCD5-4EC7-BA66-0CD047A81EC7@lysator.liu.se>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: SAMBA Mailing List <samba@lists.samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 21, 2020 at 10:51:15PM +0100, Peter Eriksson via samba wrote:
> A little summary of building Samba 4.12.0rc3 on OmniOS:
> 
> The following 4 (5) small patches are needed in order to compile and run Samba 4.12.0rc3 on the latest OmniOS r151032p (OpenSolaris/Illumos variant):
> 
> 1. ARRAY_SIZE is already defined in <sys/sysmacros.h> on OmniOS, put an #ifndef around it in lib/replace/replace.h (can be ignored but causes a gazillion compiler warnings :-):
> 
>    https://www.grebo.net/~peter/omnios/samba/4.12/array_size.patch <https://www.grebo.net/~peter/omnios/samba/4.12/array_size.patch>
> 
> 2. s_addr is a define and causes compilation problems (errors), change the argument to “xs_addr” instead in lib/tsocket/tsocket.h and tsocket_bsd.c:
> 
>    https://www.grebo.net/~peter/omnios/samba/4.12/s_addr.patch <https://www.grebo.net/~peter/omnios/samba/4.12/s_addr.patch>
> 
> 3. The “wscript” build tool generates invalid compiler/linker options (when compiling with Gcc8) - build/link failures:
> 
>    https://www.grebo.net/~peter/omnios/samba/4.12/wscript.patch <https://www.grebo.net/~peter/omnios/samba/4.12/wscript.patch>
> 
> 4. Errors about tdb_mutex_init failing with Device Busy (when using robust mutex:es) at runtime (“net ads info”):
> 
> tdb(/var/samba/lock/gencache.tdb): tdb_open_ex: tdb_mutex_init failed for /var/samba/lock/gencache.tdb: Device busy
> tdb(/var/samba/lock/gencache.tdb): tdb_open_ex: tdb_mutex_init failed for /var/samba/lock/gencache.tdb: Device busy
> tdb(/var/samba/lock/gencache.tdb): tdb_open_ex: tdb_mutex_init failed for /var/samba/lock/gencache.tdb: Device busy
> 
> This patch fixes this:
> 
>    https://www.grebo.net/~peter/omnios/samba/4.12/mutexattr.patch <https://www.grebo.net/~peter/omnios/samba/4.12/mutexattr.patch>
> 
> (Probably an OmniOS bug, but it’s an easy patch in Samba so…)
> 
> 5. fmemopen() doesn’t exist on OmniOS. This is just a test program and it’s not built by default in rc3 but anyway:
> 
>    https://www.grebo.net/~peter/omnios/samba/4.12/fmemopen.patch <https://www.grebo.net/~peter/omnios/samba/4.12/fmemopen.patch>
> 
> 
> In order to build it I also compiled and built local versions of:
> 
> gmp-6.2.0
> gnutls-3.6.12
> jansson-2.12
> libarchive-3.4.2
> libidn2-2.3.0
> libtasn1-4.16.0
> libunistring-0.9.10
> nettle-3.5.1
> openldap-2.4.49
> p11-kit-0.23.20
> 
> I built Samba as a 64 bit binary (gcc -m64). 
> 
> With -m32 anything that uses Python fails since the OmniOS Python installation seems to be 64 bit.

Thanks for these Peter ! Can you try running a gitlab
Samba CI run and then submit them as gitlab-PR's so
we can review.

