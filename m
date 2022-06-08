Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FC543DBC
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 22:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cOOd0zAaUc+vtVFfP31GeGxeJHGvuWV92wTFzYBUeGg=; b=mnlXEO3PcmvS3lCFOARWsR+mhZ
	/fUA6Nzsh4sGeMEttkQ3AxmXrqQZ0hczCFWGOWCU6NPhQEaPqQFEof6OVZpw/EC5NkaIrNwmcdF17
	KKtxD3Zw1g3Jg7LJxVy0vQ2sOcDtx6K/1ubYQFg5H2tQvUSg8cqQu0L23VTafCXZrPxnjNOkL93xa
	/FM+9x2oI5+4jTWOa8wI5DkDfwjwjlkzFzsQC5sYnR6coaizmRBAWRqQlWKUpGfA7IWvcE/BU/v9X
	LGEipK+0OpApe8O7zmcxmNZ++UWI6I82iToClMei+Sdq6MoDflClrQ7+DL1RlPqV9HvVCB+4o5RNq
	J1cHoKkQ==;
Received: from ip6-localhost ([::1]:34274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nz2Zy-008X9Y-0R; Wed, 08 Jun 2022 20:47:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62176) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nz2Zt-008X9P-8y
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 20:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=cOOd0zAaUc+vtVFfP31GeGxeJHGvuWV92wTFzYBUeGg=; b=OIrXugPuPdzOi3XdwQ1IXVhNJf
 /OG0rYyVI19zsmeshBd1HJf2iNyT/SSlxYNyC9liVMVUlzjFME7KoZSxWbrZKK5+541t9wAdswX/V
 JMq0epBNc4O5UOpIXdqmHzHYj2oUUh6j+1cG+n1AmSQ9w99iAqS9e5TC/cqdnrJ92rpHChuqNNwxD
 tbT9HKXT12yz/Zk83XZ2JlNONa35dlHXsfhAF8/wjKieUZdbASaB1e+py2VlT2kZuqDP0Vs5Q0mvg
 raPCu64cBdInWBAnp3+XT2PsA2eIh29rx+VUVTjFlfd11VE+NfZs3E5q7U4EVY0JF1rWNNEtvp7YT
 LLGgvThFQDRI9SaMkdY8FaliVcguQI9yu3FMlw9hB7IqgvpSp8YPeZKvxbtv130cZGl1M305Syxkq
 pJ7+SU9hsidwTr8W9B4Gtl14dmJl2Wpbx/0SvoqGXBUrJTrNlBjAo5tAw+ysUrI3dhq9kjGowViTp
 Im/GtHKUpVdsbl4EZaNuFcmA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nz2Zr-004e88-6f; Wed, 08 Jun 2022 20:46:55 +0000
Message-ID: <f160ccd9-f0a2-7e1a-d04e-e35473917ae3@samba.org>
Date: Wed, 8 Jun 2022 23:46:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
 <1737413.VLH7GnMWUR@magrathea>
Subject: Re: More Podman work needed
In-Reply-To: <1737413.VLH7GnMWUR@magrathea>
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Well,

I tried simply starting off with quay.io/centos/centos:stream9 (and then 
stream8) and it failed 
(https://gitlab.com/samba-team/devel/samba/-/pipelines/559016078). I 
then tried using the existing quay.io/podman/stable:latest image and 
installing diffutils on top and it seems to work fine (I hope I don't 
jump to conclusions - 
https://gitlab.com/samba-team/devel/samba/-/pipelines/559093380).

Then I took a closer look at the recipe for building 
quay.io/podman/stable, which you can find here - 
https://github.com/containers/podman/tree/main/contrib/podmanimage/stable (Containerfile 
must be the RedHat-speak for Dockerfile), and as you can observe they 
pull some tricks to make things work - install fuse-overlayfs and apply 
a special configuration. Seems like I was really lucky to pick that image...

I'd argue that our requirements are "stock POSIX + diff + podman", *but* 
podman installation is not a default one to make it runnable within a 
Docker container.

I estimate that any future instability might come from the podman side 
and not from the Fedora base OS side, and therefore we're better off not 
maintaining special podman tricks and relying instead on the maintained 
quay.io/podman/stable:latest image, even though it is based on Fedora. 
We had some bad experience but hopefully it will not repeat itself.

I would not lock the quay.io/podman/stable to some tag we know is 
working, because it prevents us from receiving security updates.

Thanks,
Uri.


On 6/8/22 15:03, Andreas Schneider wrote:
> On Wednesday, June 8, 2022 5:23:09 AM CEST Andrew Bartlett via samba-technical
> wrote:
>> Kia Ora Uri,
>>
>> Thanks so much for the podman work, this was awesome!
>>
>> We have had a couple of niggles on the CI recently, and one was
>> that quay.io/podman/stable is following Fedora images fairly closely,
>> and 'diff' got dropped from fedora 36 by default.  Ouch!
> 
> I would suggest to use CentOS 9 Stream
> 
> https://quay.io/repository/centos/centos?tab=tags <<< stream9
> 
> instead.
> 
> 


