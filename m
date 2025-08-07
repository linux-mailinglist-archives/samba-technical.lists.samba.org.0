Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9671FB1DC90
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 19:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=svBx7AFFUSkJmZFRC6OUBtW8jeSov9IINw65gwHuRog=; b=2+a70+yax0OYfeTcXzYF8dOagK
	JeiRHwUcWj2RmYnbYCe0fUFdhXvf8iMRZHe+s+39/7Ieqek4UsRZY73Pn5h6TIWlectJASZFNehId
	AeKNGw5JBPsIdXKmHrWQtpIkF4dh1y39ch9wJnKEaXsVWeQoQVU1Eo/KQ4lRBnXuNHo0o3brY2rnj
	mqdbj6Pn/u2119jLy4HsUs1/cpyXurCreR0mEzTuu+qZmSn9+9f+/+aTHbScOI2gScT90Cnx3p0LF
	Hxdr9h6HcY1DB2y+riJ7dUSroaZfqzKbJ4SBvWaEspzt78wTqz94zdRYilGqTm77AJbfPP8hvarqO
	08Xq0u8A==;
Received: from ip6-localhost ([::1]:55484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk4e5-00EazF-Fd; Thu, 07 Aug 2025 17:43:17 +0000
Received: from isrv.corpit.ru ([212.248.84.144]:59367) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk4e0-00Eaz8-D0
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 17:43:14 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9D23B13F30E;
 Thu, 07 Aug 2025 20:42:43 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 37264259F3D;
 Thu,  7 Aug 2025 20:43:09 +0300 (MSK)
Message-ID: <29a0a8de-c7cb-4438-a0a0-106fcb6a336d@tls.msk.ru>
Date: Thu, 7 Aug 2025 20:43:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: new deps for new ldb module (in 4.23)
To: Alexander Bokovoy <ab@samba.org>
References: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
 <aJTkachtlSAw1nIW@toolbx>
Content-Language: en-US, ru-RU
In-Reply-To: <aJTkachtlSAw1nIW@toolbx>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 07.08.2025 20:37, Alexander Bokovoy wrote:
> On Thu, 07 Aug 2025, Michael Tokarev via samba-technical wrote:
>> Hi!
>>
>> In debian, we package libldb separately from other samba libraries,
>> because libldb is used by other software (sssd).  Up until 4.22
>> version, this was possible (*)
>>
>> Now, 4.23 introduces a new ldb module - trust_notify.so.  And this
>> module depends on numerous other samba libraries:
>>
>>    NEEDED               libMESSAGING-private-samba.so.0
>>    NEEDED               libMESSAGING-SEND-private-samba.so.0
>>    NEEDED               libsamba-hostconfig.so.0
>>    NEEDED               libsamba-util.so.0
>>    NEEDED               libtevent-util.so.0
>>    NEEDED               libdcerpc-binding.so.0
>>
>> what this new module is for?  Should it be part of libldb?
> 
> It should be part of Samba AD build like many other ldb modules which
> link to DSDB_MODULE_HELPERS.
> 
> This should be clear from source4/dsdb/samdb/ldb_modules/wscript_build:
> 
>      if bld.AD_DC_BUILD_IS_ENABLED():
>          bld.PROCESS_SEPARATE_RULE("server")
> 
> and source4/dsdb/samdb/ldb_modules/wscript_build_server contains
> trust_notify module.
> 
> I think what happens is that this module (and others from _server) gets
> installed into the same /usr/lib64/samba/ldb/ as the base modules and that
> your packaging does not differentiate them.

Aha!  It is just me who completely forgot about samba-dsdb-modules
package, which holds most of the AD-related modules, - I thought
I've only libldb and samba-libs.  Yes, it's definitely a part of
that larger set, and yes, our packaging definitely differentiate
them.  Thank you for the pointers, this one is fixed now!

>> This is a more broad question - should libldb be usable by
>> its own, without the rest of samba?  It's been a semi-private
>> API of samba for quite a while (together with libndr), but
>> sssd uses it anyway, and it's been a constant pain to work
>> with.
> 
> When libldb was moved to be released as a part of samba, it was still
> supposed to be usable as a library outside of samba.
> 
> I guess we don't have a good test in the selftests that would track this
> target. On the other hand, SSSD relies on the same base libraries
> (tevent, etc) that samba does and also links to Samba NDR libraries, it
> should be ok.

Well, libndr is actually a part of libldb package in debian :)

Yes, libldb+libndr uses talloc/tevent/etc, but not all the other
samba libraries, except of this part:

>> (*) in 4.22, I had to revert one commit for this to work, -
>> 542cf01bfe530 "ldb: User hexchars_upper from replace.h".
>> It would be great if this commit is reverted upstream too, --
>> if it is somehow desirable to keep libldb usable separately.

With this commit reverted, libldb can be used without all
the other bunch of (private) samba libs, and sssd uses it.
Without, installing libldb pulls up half of the samba - exactly
in the same way which forced to link pam and nss libs in its
own unique way.

This is obviously manageable at the distribution level, as long
as more code from private samba libs is not used by libldb.

Thank you!

/mjt

