Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7A6E0B9B
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 12:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AwzA+/Ypf9jj7NciPTi41FH0yJEnOci+t3e92q7Ho0I=; b=Ky8LuAevHOLV40KkfNJc1E/P4Q
	xq86hrbKquqmFDD6wj5b0GpOYhZ9jLyDmJQKOlhZYNMkGcwsAFbCqTo+FSOCrOtdFRzafwp1T9A/s
	WTLuzzp0Q0hXQxQxbXbALRTSrmw4hIcIBZ7O7+NEAvuRRQFvq6FZNpkvovGXZ4kuyU4NKLD7tIwq8
	XOXfJ0zh8PFxYeSSbDNnefwzcv8PBmybb5jznuvZ+7J8sicScX7+3siTdf/1pwaa2MugEvZfGCegw
	5GZMXjUehNdcCz1gFuf/0czwb3+59LB/SmqvR9TtPu90MEsgQcfD9xp0dicH3vd+gaD5x8aaTB4WB
	41DyK6ZQ==;
Received: from ip6-localhost ([::1]:53090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmuPK-0013bx-5k; Thu, 13 Apr 2023 10:42:26 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:42320) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmuPD-0013XA-0z
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 10:42:21 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 9A19881993; 
 Thu, 13 Apr 2023 22:42:07 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1681382528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwzA+/Ypf9jj7NciPTi41FH0yJEnOci+t3e92q7Ho0I=;
 b=Zf+bQqtYGhRLfnTvphrcxLBSWQJo3jVxS0h/10F9sLbGJKFI1JdTSlPVzsdMyiDPfeS/oK
 XfB0XTKYSG8wUWF57gsZ3eel/bvzBAjpg4xG5/Pa5pXmIMD9S4TvOUZ6eOUY0UgDfFCJbk
 J8/Q6ZCaZMGpG1ZHwHcv0X7ua8gljElQInFRjFWt/fdACgceFe1ElAGbizHOapFlUYq6Hr
 Kasi/m56OsyU7tKpGI2pXLxSxQ0k/A+I0+h5TwnZNrbRSRSrUtISS50+pImyQntlQpG+Ar
 ABiXugOUo7EHXtnCXs7WAXleBJXwEIvUck/rXFs/F3E1aFZlnVHK7yqAAXjaMA==
Message-ID: <4cd5f631-f135-858c-5d9b-5913babef316@catalyst.net.nz>
Date: Thu, 13 Apr 2023 22:42:05 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: The strange issues happening with ad_dc_ntvfs environment
Content-Language: en-NZ
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2142927.irdbgypaU6@magrathea>
 <8c78e366-5b95-f407-3ca2-2dc561b1d2f2@catalyst.net.nz>
 <13246326.uLZWGnKmhe@magrathea>
In-Reply-To: <13246326.uLZWGnKmhe@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/04/23 20:51, Andreas Schneider wrote:

>> Is this with a full make test, like you were doing in February? I can
>> have a go at that overnight on Ubuntu 22.04.
> 
> Yes, I'm still trying to get this working downstream and I think this should
> still work even if CI/autobuild is not running a full make test anymore.
> 
> This seems to be a bug in some test and we should fix it.
> 
>> First I'll try `make test TESTS=ntvfs`, just in case that works.
> 
> If I run
> 
>    make -j8 test TESTS="ad_dc_ntvfs s4member"
> 
> it passes just fine :-(

The TESTS=ntvfs passed. A full `make test` gives me these:

failure: samba3.blackbox.smbstatus.test_json_profile(fileserver:local) [
failure: 
samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//fipsdc/tmp](ad_dc_fips) 
[
failure: 
samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//FIPSADMEMBER/tmp](ad_member_fips) 
[
failure: samba3.blackbox.smbclient_netbios_aliases [foo].smbclient 
(krb5)(ad_member:local) [
failure: samba4.nbt.dgram.netlogon2(ad_dc_ntvfs) [
failure: samba4.ntvfs.cifs.ntlm.base.unlink.unlink(rpc_proxy) [


I'm running it again to see what changes.

Douglas


