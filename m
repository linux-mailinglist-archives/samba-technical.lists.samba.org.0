Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708C3FCEA4
	for <lists+samba-technical@lfdr.de>; Tue, 31 Aug 2021 22:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yPhhDD4Tb2sbxARzG1Tl+hpIyCiaEf1G3qA843kSFtA=; b=IkOvhTz1GEbZVAgOEWNF4YoFK1
	IBYu8azYXKc3KXhE25cDdcRaPhY96vVwbuG0p9mL7FjhzBAE/K2h/zVYeRkpKQWmb8wHsBojy6Xb6
	Wn4eQ16GbGs2N1zyvRhh/nPONFbtMP7rausZMojaQhDa8iW2iElgX8qa0+zsHoFQrLsz57c+sVaZE
	27boMztla+fikKJ/QYnSTEEO9J2XoHlw2kzm3lDE2zzWX3XEwJOLAHQ/YeJdT5ZqRFIx0dLVQPJb9
	mMWL58e5wBdkNKcvjcHSv9sFe/qqRwADp/Hmy7DRUTFgNWaFZ+WAnuLxzY0ApfDhIlUkRLysqg0PT
	9nTTnpdA==;
Received: from ip6-localhost ([::1]:58128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLAUa-00AMM1-W0; Tue, 31 Aug 2021 20:36:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLAUS-00AMLs-Dt
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 20:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=yPhhDD4Tb2sbxARzG1Tl+hpIyCiaEf1G3qA843kSFtA=; b=uAHxjNkx6fnoygodiC9I938+n4
 ujolwJ8IameN0iWKk9w6b1vqjZUU5TNAKVvklAM7CwvBGTU/TzjOom5T/wJXWQwf5I9N5XRAbestX
 G/R4fKZOmoDjSls208X9F7l918i7pga0OYf44pSzpsCv1O/m3sJrDaQeSH+O6HzxOrAtNehQlJ1lw
 ftaK7I5RWsqBGp9Ac3NscPg8e+Wxan0L/8RgnEe6zfubO/T1FUTF0d20WFE7oY479c0lfRVqYG8xW
 PLYy/lE17OrQ6KkouFrnmedcct3wJW9/WddCJ0OqWAVLTrcxHYkyg8XFfBMX+IcdCXyeE1AbtBUqq
 BdsxOLM/xByIq5oAwx6cHbHdJ7PmP5spjbtQ3flB6Y71UhMJnvFAbUI6nDx3RGm7XemNKOdg8TfXY
 Vgk7knoEY3RfUa1oQGTU5U++YPpdw+MlZoW43B/rRNa7sthA36/4PsVpTyp0Cubtjiv0Vpf1WQiwE
 bDo8aS3mayXWBVGBrL772ulf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mLAUQ-003vQP-AZ; Tue, 31 Aug 2021 20:36:15 +0000
Date: Tue, 31 Aug 2021 13:36:05 -0700
To: Matt Grant <matt@mattgrant.net.nz>
Subject: Re: Help writing new SAMBA_INTERNAL DNS test code please.
Message-ID: <YS6StQYsctrwXzvu@jeremy-acer>
References: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 31, 2021 at 05:20:57PM +1200, Matt Grant via samba-technical wrote:
>Hi Andrew!
>
>Have not created Samba bugs for the following yet, as I am trying to get
>the hardest part doen, writing the test code.
>
>   1. Dns server port number specification for smb.conf 'dns forwarder'
>   server list
>   2. Restricting the dynamic DNS update ranges so that the SAMBA_INTERNAL
>   server is not spammed with IPv6 PD addresses from the ISP.
>
>Main issue is being able to dynamically change the smb.conf setup for the
>Python self test hookup, for 1, specifically within
>samba.tests.dns_forwarder.  Being able to do this will also make 2 far
>easier.  After looking at the test code set up, I can't see how to
>dynamically change the smb.conf file in st/samba/smb.conf while the tests
>are running to set up for testing the port numbers or not.

Look at tests like:

source3/script/tests/test_deadtime.sh

they use a feature:

global_inject_conf=$(dirname $SMB_CONF_PATH)/global_inject.conf

that allows a test to include dynamic smb.conf entries for Samba3
tests via the line:

         include = $globalinjectconf

inside selftest/target/Samba3.pm.

I don't think the same feature is in selftest/target/Samba4.pm
but I'd look into adding that. It might do what you need.

Hope this helps !

Jeremy.

