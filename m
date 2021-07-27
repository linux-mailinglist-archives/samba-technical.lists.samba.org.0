Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B719E3D7060
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jul 2021 09:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=n5YN+fVwyYBYuu+1AL1Vd2SaRxOmiPZcF5vfNHfszvo=; b=cQ3oZvIGU4T0a7mQrvaPvzhSB5
	wCBKyWfsszTD5J5E4LGz2k0BnOnOT3Bp8kvwl2VxOqEkobQcALBljTxvYL22tRyj92sbe2NfqndqR
	z+eEXy1VZm/MdyZAmr6AXW28ZF46YXvr5iQLVpv7UDPKMtI3a2cxewl7LlRrkQhT988iHtGqY1Rqv
	2qwCUmuhKbja3Sdif4pvuq83VN+NMVyuYg2imnUE7B1Cw1P7cYNE2pCwPBWGB+3VJqc/a8yEeZ07t
	RGzh7kTYRDgfgI6m6WbyIQ5U6bhyLySeFjVHoePL2Tont+R2SPGPTzTnseiIpbd/BPt5kZ/g8CRuv
	MCbuoS0A==;
Received: from ip6-localhost ([::1]:24454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8HXm-0013mQ-TD; Tue, 27 Jul 2021 07:30:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8HXY-0013mH-1y
 for samba-technical@lists.samba.org; Tue, 27 Jul 2021 07:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=n5YN+fVwyYBYuu+1AL1Vd2SaRxOmiPZcF5vfNHfszvo=; b=y9X3OvGKI5kqGYnRPqkyQ60ZS2
 X9gVDEWuQQ0uKoQmjBA/A9uFDW4RPQFm3R6QzoYDh2bJ5Vl1W5rxPGJVcPacYpqeOHhfVaNJbWGai
 c3bTS62a67/B1SfH8APynB8eHkWgHAdmCnmMMBsFFj9HjSlzfRepe2Il+LdvbnsV17lwOSsMB9YFn
 B/q7drVxoYUAb/t6nG6Wsr6ZweiP1aVwYJJzqzQD51ECcf8f7lOGhEpNaXcFTf6bqbBXWtfH3aroR
 p814zR1U6k4NVssywH3XfSvOQy4D1mc8SxQv44hnzgt/H3A/VP3wLMUbN++RSp2p7G+imf55C9WN/
 JZz9QCTlZYFToABNXYzobN+3PDSxYtJRcNS2wizvGUqI4dJa200ZmsBbGnkDIKydEJ4tQcPRKKmkJ
 7f75qJoIY6rx3sHzZFcUe1Zy5n2fOkZcnawio/HYdkeuD6hSfBbVp6fqZclkEJvLYAu0XzXZPwnar
 FUNhzkGu/mj3VYUGRp2N4uEk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8HXX-0006Re-9i; Tue, 27 Jul 2021 07:30:11 +0000
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: miguel medalha <medalist@sapo.pt>,
 samba-technical <samba-technical@lists.samba.org>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
 <201468d0-47c0-1a5a-efdf-7206e70f7e8b@samba.org>
 <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAGkqX8XX4T5Mg4ytd667iVsBAAAAAA==@sapo.pt>
Message-ID: <bac38c9b-31ce-a544-e541-ddfc8edd10ad@samba.org>
Date: Tue, 27 Jul 2021 10:30:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAGkqX8XX4T5Mg4ytd667iVsBAAAAAA==@sapo.pt>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 7/27/21 9:31 AM, miguel medalha wrote:
> Dear Uri
> 
> Does Samba have root access? If so, wouldn't it be possible, when using "acl_xattr:ignore_system_acls = yes", to set permissions to root:root and 600/700 instead of 666/777 and let Samba do the translation and authorize access based only on what is set on the "security.NTACL" extended attribute?
> 
> Best regards
> Miguel Medalha
> 
> 

(adding the list)

To guarantee a specific unix owner for files in a folder exclusively 
accessed by smbd (thereby getting the kernel out of the way or 
implementing folder quota), the following scheme could be used:
1. set the desired owner on the (empty) root of the folder
2. set "inherit owner = unix only"
3. set acl_xattr:ignore_system_acls = true

regarding 0666/0777, I'm afraid that's enforced by the acl_xattr module 
if ignore_system_acls is set.

Thanks,
Uri.

