Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 675FA388463
	for <lists+samba-technical@lfdr.de>; Wed, 19 May 2021 03:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=90vl3uEZTY0+53E3i2cHs4vdedSWYzm0RNkEP7RpvPM=; b=Ztc8mPv3fwPSh3jMAL5Hb/Lak4
	LdrM4gtHqb/n5FxwBSJYjY8hc+W1M5CsEXX2cx0gws2M3Rdz6vH4MAuD2+Qa3mXLZRwzyqeajgwVM
	WneLWlauyRaz64rs9VdYGrlx53j/8glkubW9W3HuHKQa+nrpL+mNmswYXNzmzgg6DEodEwxxXUq++
	/y5GB2xdNY5d4c9/0eawiuuyg5kemR7l00jp+07g1zmeLGpf07l/jAKjQ4wHZdbnLummwPPlfxHls
	bW6G60+vAyPJB1iLoLt+9Pfd7EOeV3hmltdXnsnjLwuO8MzzrsHRN0RoDOoaEgb+EW16oSnyJo5cv
	JrVs3SOw==;
Received: from ip6-localhost ([::1]:54840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljAul-001Z9P-AF; Wed, 19 May 2021 01:22:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13022) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljAuf-001Z9G-NP
 for samba-technical@lists.samba.org; Wed, 19 May 2021 01:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=90vl3uEZTY0+53E3i2cHs4vdedSWYzm0RNkEP7RpvPM=; b=Ge7Bzj4ffvg1A4sbhYliKYcI9D
 EBKScBG0l7KJKCaozAzEoCDxW/BMtl02P9m6m/Ar6OHdGZsXFk0txgtTFFz+eZwXVL4uk2uUyJ6q3
 zwhRe80Hh/jzxQ7JGxkLbUDRFt/evJmcF9M8RA/bTc0A71fZmE8IS2CGm29Y8raGMkJNAV/cW2DcF
 bkjqZyiUEHd7L36Oyg4QutH3fI36tSYgOIaHLqu12c/CACljIR3Vli/ZEQbwxfbju8D4JlictXR6w
 RcDSCvGSYOUyE3ydeangZezyb3G8rRpTwVRDL5avo8HWO1kx2dtJzErvGUUk9bs2yfva1ou7+rN6w
 x/7NQwjXxT0DowzuapD6i/UuiMhW3qv2RdwhGi20IutlKmHgvrWMQHN7IUBACtsN+Pdo+pCyj09ai
 tmnr7My8hKAMh0IAyVc4yxTCH53fW0Fu5RP5mMycG9ZX+DWVBE484OxREyHvlZ7Q9rH+9grxSOdZh
 KDDuwdOI/GwXuJj4MFaupgvS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljAua-0002RA-NT; Wed, 19 May 2021 01:22:13 +0000
Date: Tue, 18 May 2021 18:22:08 -0700
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: Offline logon flapping in autobuild?
Message-ID: <20210519012208.GA2052847@jeremy-acer>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <2444523.AYHQVFttfo@magrathea>
 <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
 <4972011.ALVdVshByh@magrathea>
 <482fc14dfd6b782ec12643f88d4c65d9f266619c.camel@samba.org>
 <4cc918ff-1c0b-b35b-163a-ef85e97df7cd@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4cc918ff-1c0b-b35b-163a-ef85e97df7cd@catalyst.net.nz>
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
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 19, 2021 at 11:54:00AM +1200, Douglas Bagnall via samba-technical wrote:
>>
>>I think my username is too long (I've had this before), and your new
>>test environment has a longer name, and so we are hitting the maximum
>>path length.  This is why jra, bless his short username, gets to push
>>all day without issue.
>>
>>Just a hunch, no evidence right now, but we have had things like this
>>before hitting the maximum length of a path to a unix domain socket.
>>
>
>I have struck the same issue, presumably because "dbagnall" is just as 
>long as "abartlet".

Andreas, can you shorten the test environment name so we can
get past this ? I'll push as it doesn't seem to affect me.

