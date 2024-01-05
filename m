Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA638254D1
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 15:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+1FNVgsj+qEWnvxHNGqdoPY64SlF8p/+fHrooM8zYkM=; b=TqhMKVjc6g+0IgAcPH8TMzHxQU
	hVgvje7P9TSbqgLleqKTLl8SpxGwJ/UwtYDSK7PyJGA0RB2dtXzWsmkSR6CwbxvyJfTmxSaJOureO
	uVfYpwZ7D/of+IvkR7nZ4x1Gvru6ayD5VW6epS1QqL8n05VVfyi0j5wjx178WGv6JVzQfnXkVk+QM
	bzES3R0Zz7MCI71nhhaqeJCGj2aJVceZAkPGzQwQC2B9p8St6+yZIfjcRTGzBSeM3sD4CQwDqz6za
	ug8T/UlxbKyuD6aWkDZkwUM4zELxZty9GAIL8z/adyGamGdypKLeTl6dRYgnyxHULmb48HerF4aPS
	0LtfqhXw==;
Received: from ip6-localhost ([::1]:28958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLkoj-002WFX-6s; Fri, 05 Jan 2024 14:04:57 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:52810) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLkoc-002WFQ-Dh
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 14:04:54 +0000
Message-ID: <1d2bb04665d19a4722a0b9f7f552cab3@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1704463486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+1FNVgsj+qEWnvxHNGqdoPY64SlF8p/+fHrooM8zYkM=;
 b=ctnF/fbzbkDthaVPva5if5djG2bq6W+3+ARQNPmEDGhN7aeEywM7B8C2t10Un7VC2+MSuf
 CTbfuO0HBqfn8+HfDph0cBDfoPz1kXqSigPssFBonKnC7mMMI4WTbLrhmsS07KU9/lusXb
 88POJKP7oFoeTfm7wmlEpU+U2LApL+5A6ZFdKwZnaVg6Sfs14urLVrWErvwfO38ete3Y0d
 lpYgjJgZsBdc9855VN0dYyl4zWR8hFOuhv2pKlBV5C4sRA19oJNCYdsfvUT7Vf8DKVRCOx
 VES7OYzfLhuURqBE8dCshjgcRkR4QCY4ci7M55p5zwDRGv1uqxSA6SrjAYXDFQ==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1704463486; a=rsa-sha256; cv=none;
 b=E3nD/uSc3rlSDyQwsy+DdSrppLHlk5z48Dy0FmXC45LqO7knRCq13R1qHFHx95AKZxDyOB
 0ZzYwmpHIwbU6vfvqDk9JmWt8iY0vNQRfU1tHr5wZwiKHLJQPsAh4yHoWhcUwPMB3Ll/s6
 3hSm+TMBvNgwZEuWEGyLAkYxOykF1ARGXgXOO+eCBRmwy12eepYGyHqEBpo4aHNtuTHILU
 t3JR/mIhZnjR4bA670FDDjwFjfuNvuLGlFtdAq3ea1v3U/v4EgM0mvVBnZBdKe95JlvYWk
 DU5zreM+gKwv+sHLNjCpEZo1vX/JCTYeE9BrtDCs1zzu9rsy/i5sg9e/e9Qckg==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1704463486;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1FNVgsj+qEWnvxHNGqdoPY64SlF8p/+fHrooM8zYkM=;
 b=W1PlfjcTslLslIr4fj9tv9upynqeeY0WXI+Op4qhcXRMM67a5Sxrgamo6/wWPZBmzfB7oy
 yChfeOngZMPWB4SILw+b1oBTk0nsfRxioCAoSzZUIjwWqqVVd2gpKu3h4aFry8wph6AI9i
 5iJ5rOsrgxXxpb78iqlGaratTaDnfPQqYjmfDAhflQRZK4sYc10dv9RfG/KAAoglSU5mkw
 bNhURUr2ClJHhRwBgr3h8nTM5uITDGznrnBKDdT3aXnNghPA0jPlaN/PiHKfCHQ8sFHj7Y
 FCw5Dv/ATBNNvR0f3IIvwTOKwVJLIr5qEZXmH7htFXiGyEFDBJyDn+J3OOJO+w==
To: Salvatore Bonaccorso <carnil@debian.org>, Steve French
 <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Ben Hutchings
 <benh@debian.org>
Subject: Re: Information on use-after-free in smb2_is_status_io_timeout()?
In-Reply-To: <ZZgFEX3QNWWj_VxA@eldamar.lan>
References: <ZZgFEX3QNWWj_VxA@eldamar.lan>
Date: Fri, 05 Jan 2024 11:04:43 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Salvatore Bonaccorso <carnil@debian.org> writes:

> There is a Red Hat bugzilla report in
> https://bugzilla.redhat.com/show_bug.cgi?id=2154178 about a
> use-after-free in smb2_is_status_io_timeout() . While the commit noted
> initially there seems not correct, Ben Hutchings raised a question on
> more information in
> https://bugzilla.redhat.com/show_bug.cgi?id=2154178#c24 .
>
> (there is a CVE assigned for it, CVE-2023-1192)

That is supposed to be fixed by

        d527f51331ca ("cifs: Fix UAF in cifs_demultiplex_thread()")

While the commit refers to an UAF in ->is_network_name_deleted(), this
should also work for smb2_is_status_io_timeout(), AFAICT.

