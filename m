Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E67295C56
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 12:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=2BTAOUGTwQyDdOS5cc7wacfpJ7I+zpWdV39kEm0EBzI=; b=cDzvvm+gxkNcCodrDITW+c6vgZ
	/NhenA6QHKtldBm30ENrj4PtMNTW6xns2XKFDF7IMyTc6tFXFAmFcoxl7saTlpIsW9AEkZTXBVpLZ
	MQAKmT+L82u+yCwpuUoJo5LDFSQRTc1VXpTpYCtL5j+4mqIfOShz1tA9VURpUpA2MEE5o+90klXRF
	8V5+yn72hrXEwpIeIJVh/OOOPStLPRvXDtGbqDy0jkywFRca123iwStbCug5vBoC+xI7iOL3NbwrX
	+RDT0kxb0MVfJOsCi1JyZY8qr21zCiEld/c/HI0n9VDHYlJI/uWd74p2APvKXxnNW1x+TL0bDKrcl
	WU0Sk/6g==;
Received: from ip6-localhost ([::1]:40168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVXNi-00DFYJ-9s; Thu, 22 Oct 2020 09:59:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVXNd-00DFYC-2C
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 09:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=2BTAOUGTwQyDdOS5cc7wacfpJ7I+zpWdV39kEm0EBzI=; b=iMONAwJzc09lfr2DtMqHq6iqee
 fBR877zwghMKjkdHt3FUPBXRvS3KAS8NKJIedx+4aNa1QNAIHUkV6F/6vgYw5RZ+Gl9R40xtauyM0
 73WeyXrTeKCELbPDTXXEGVlSxTAJiVAwGzNR8ZjlMhRpyuaTr2paXZViu830soUsOh38a6Y1hQhDR
 nwpu8rZPzPeJCV/3JzvLIFouzDGVSA5gfiaESXWxQ39K6Kn9opwsjpN/EwEY092Ze2KMLOhIOOYVZ
 jaHzMnPd+Cs562CdtMibwqI5oqPrhJB2VgAmav+8abEZuJbtfazfdOQEPEtW50sjx9SK59NHcnvUJ
 N6eE5f88X8A4vNzDV3k3tc/hzo1Ku8OfRMeUinKAVRiv5pCUkyOUzGeoKBw5g6De66CebPYC8S9vm
 6zM3PIo71wq7+pS6t47QNBXkdX22Ygr+cxB8afm0n07n1yuf6lOK7ix1FktFEl4oBTMza5SOMHLsX
 wxOysVWKoXGiCA+yQrJn0my1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVXNc-00005B-9t
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 09:59:32 +0000
Subject: Re: 4.12 -> 4.13 upgrade
To: samba-technical@lists.samba.org
References: <5E76D2F9CEBD40A2BAADFE3EAB53360F@rotterdam.bazuin.nl>
Message-ID: <6013c870-8b8c-d3fa-cee4-1dd9fa9dec61@samba.org>
Date: Thu, 22 Oct 2020 10:59:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5E76D2F9CEBD40A2BAADFE3EAB53360F@rotterdam.bazuin.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/10/2020 10:06, L. van Belle via samba-technical wrote:
> Hai,
>
> Small question, i cant find this.
>
> So after the 4.13.0 (on
> release date) I upgrade a DC and that failed. so i reverted back to my VM
> snapshot.
>
> I now see the following in the logs.
>
> [2020/10/22 10:48:36.514438,
>   0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
>
>   /usr/sbin/samba_dnsupdate: /usr/sbin/samba_dnsupdate:274:
> DeprecationWarning: please use dns.resolver.Resolver.resolve() instead
>
> [2020/10/22 10:48:36.521212,
>   0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
>
>   /usr/sbin/samba_dnsupdate:
>
>   return resolver.query(name, name_type)
>
> Now, when i
> look at DC2, which stayed at 4.12.8, that one is not showing any
> DeprecationWarnings.
>
> And i recently added a 3th DC with 4.12.8 and same no DeprecationWarning.
>
> Im trying to find why only DC1 has this message even after the i reverted to
> the VM backup.
>
> So i hoped today that after the fix for 4.13 for the start up, i did an
> upgrade again on my production DC1, having the DeprecationWarning message
>
> Only that didnt solve it. Its all running fine thats not the problem.
>
> Strange thing here is, DC2
> is a copy of DC1 and doesnt show this and same for the new DC setup.
>
> Anyone suggestions
>   what this is, and maybe how to make the error disapear?
>
> Its a very constant message since i see it every 10 minuts.

You would, that is the frequency that samba_dnsupdate is run.

Could you be running bullseye on that DC ?

Which would mean python3-dnspython V2.0.0 and in this version 
resolver.query is deprecated.

Rowland



