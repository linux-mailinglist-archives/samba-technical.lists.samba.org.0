Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA08CF998
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 14:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eAtzRFyhqXVC9UmY8M6Ft2saIiuaYGD18ldOQW8qaDw=; b=rlHyswa7OxyqX8UwSWK7xg66C2
	sF5OAKMDDuQC5R6shCxpIiGTjwsoNiPx25u0OrLh10siajXyB47wpK5wwsgdVZiMzgnovhIMj6ahV
	9rRkxYTKOp0H1GTB1Lze/YZJdtlRtZTo7joB6tWKQvBWRWe1H0HLy5pD7jMjpGgEfR0jS6SUzaXsF
	+9VQhmss1Uzl8gzYVjnQMIGxdrrIVfycOWT6NyPvJdu+Za6zrIVl17K81zVtGt5hPX6LImaXYvgka
	iYC3DBuyjbI/k/cQoih6pJqqG4+kvniI2fyTgy1EIGKRYgQmS6eCBiQI8W0VsexntxVMrgvwXLvYc
	97BIgZGw==;
Received: from localhost ([::1]:58360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHoOn-0026Py-El; Tue, 08 Oct 2019 12:15:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33798) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHoOj-0026Pr-7Y
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 12:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:Cc:From:To;
 bh=eAtzRFyhqXVC9UmY8M6Ft2saIiuaYGD18ldOQW8qaDw=; b=W42qO8BHtqT3p8RVM8p3TfucXX
 rBqsnv7BIh07pTX6MlAHsx6NYmqwl8Iw/VCqxdvnzsHPnU4rDDs9JmNETKEWZQ85Y1PM2qZc5espz
 iAmqwBVlYpKhay/SjVvtEA9dwBbY8wsaB3IhyuRJOAz2Vg1gszDMPYYwgNbzjgxKpGz4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHoOi-0006Hy-OF; Tue, 08 Oct 2019 12:15:24 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: David Mulder <dmulder@suse.com>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
Message-ID: <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
Date: Tue, 8 Oct 2019 14:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David, Noel,

thanks a *lot* for taking care of this!

On 9/27/19 4:54 PM, David Mulder via samba-technical wrote:
> Noel and I are looking at converting any old SMB tests that target the SMB1 protocols to SMB2+. Is anyone else already working on this? Does anyone have some pointers?

what exactly are you looking for?

I guess at least the following needs to be covered:

- everything in s3/torture/ that calls torture_open_connection()

- everything in s4/torture/ that calls torture_suite_add_[1|2]smb_test()

Am I missing anything?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

