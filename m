Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0347383D1B
	for <lists+samba-technical@lfdr.de>; Mon, 17 May 2021 21:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2uqXNKWFNt0hGK9lHYYoJQHOUh8QSJaQRrF1ovfBqJo=; b=ROBPzRj4nghdLfCkDhw9Olk8rD
	QIDJPPQwyNAtIKYZkVpNRO/yNMaDOOtev+h3GCfDEpBucP8nswWPxOvCimYZj+ehow2X9PZK1959w
	IiVwWfvBWiGhKY1iG8+VLsFV4EtIc+UNQPddMFjc/zjS5y40SVLcSq8OL52/tC+yhDavE0hBIigNI
	ocsGyUWYhoKMTZk64zkyXoZ9nEiosYV8mK2aArNK8fLwIBcJ/425sY+lQo0NDzMwS0fA1Gp+4+gtP
	uqrtMYkdKghu6glg0WZbh62zStuUzZDBY6eKVBxYxsuBZB0SidaaIv30K5s7pbBSmFzrhC2dZ4GZH
	25SxsKuA==;
Received: from ip6-localhost ([::1]:34424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1liilq-0010QW-V1; Mon, 17 May 2021 19:19:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59326) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liilm-0010QN-A9
 for samba-technical@lists.samba.org; Mon, 17 May 2021 19:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2uqXNKWFNt0hGK9lHYYoJQHOUh8QSJaQRrF1ovfBqJo=; b=ajGYvkcjt4zJ6ogxIbxg0BoL0X
 vsRVkoiqYtYuGsfULg9sV1Xfj9esGovDU+U3kZusmxlh4B5zcQBX98kh7hI0pbDkEdiDX31bfeoM7
 QXJ2jGw9/wbBiETwmih98tuAhfiRLQlIoJ/M3GjJs4yUodIIV8C/IFH0GHMVBuuSTxao0IDslahp3
 poZyAcp/48Y3hceCU8/p2VCdntJVwdouWoRqn+lGhY3zX/BeQ5duS9bls7oJ8P5DTvJpA5SrXvf6W
 1O12Bteu2DKP61CVM1jA6bX6+tz2sw4YSeZ8vhDU/GrYAQykJLmVt9Y1ywNN+Nw7AVsUjx7CS0ekU
 x1ov+C6ssszrw5aDMVXBHma2731fZ0hw0FNrlcOX+Htlwj/WSLLXoAuqYXekvxj5BcHYBnYxJagBQ
 SXDTjR6aTwxwj7011yweJGQtBUk9PSMYLE6kzQUEYcstgvac2vPZXbjhPTtbARSBq0y8g7WuRWHyq
 mgpBY2RRe4p5yprBW/scKdSh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1liilk-0007e0-Kv; Mon, 17 May 2021 19:19:13 +0000
Date: Mon, 17 May 2021 12:19:09 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Offline logon flapping in autobuild?
Message-ID: <20210517191909.GB1795539@jeremy-acer>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <1949061.8nGXxLBRy0@magrathea>
 <97407ae87bceb340ed01e5a60f0417810d8ec3f6.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <97407ae87bceb340ed01e5a60f0417810d8ec3f6.camel@samba.org>
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
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 18, 2021 at 07:01:14AM +1200, Andrew Bartlett via samba-technical wrote:
>On Mon, 2021-05-17 at 10:38 +0200, Andreas Schneider wrote:
>> On Thursday, 13 May 2021 10:17:48 CEST Andrew Bartlett wrote:
>> > My most recent autobuild, with (I hope) unrelated changes, fails
>> > with:
>> >
>> > [141(1068)/143 at 6m5s]
>> > samba.blackbox.offline_logon(ad_member_offline_logon)
>> > ERROR:
>> > Testsuite[samba.blackbox.offline_logon(ad_member_offline_logon)]
>> > REASON: unable to set up environment ad_member_offline_logon -
>> > exiting
>> > could not obtain winbind interface details:
>> > WBC_ERR_WINBIND_NOT_AVAILABLE
>> > could not obtain winbind domain name!
>> > failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE
>
>I got the same failure again re-pushing today.
>
>> It doesn't really have to do something with the offline logon.
>> winbindd did
>> not start and was failing, the error why it didn't start would be
>> the
>> interesing one. However for this we need the logs
>
>I tried a --nocleanup build on sn-devel-184 for samba-admem-mit but
>this passed this time, so I'm trying another with all the jobs.
>
>Hopefully I'll get some information.
>
>Is anyone else having trouble?

Nope, all my recent gitlab-ci's and autobuilds have gone
through without incident. Sorry you're having trouble,
hopefully we can get this tracked down soon.

