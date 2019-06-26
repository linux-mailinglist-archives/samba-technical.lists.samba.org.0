Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BAC5704D
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 20:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9q+5BzEW5hcfUy7vdvqN96YaaFw+IFxbROC55poKL4o=; b=A70SuQUbO/oF3dfduJSBsxbfNp
	dtDeh+myoxFaSNn94QgITE63eUMimKd81wVmzTOJtnPLUhg6Io+/X6XF/YNdmwsQCurHsW8Bpxi4z
	X+e1to5OUYky3onhnOXmOSFCVTJ+DxhDnLu5cc2J01j427DEHCkuaqJgF9UnqQNd5lic1tSF6wjVs
	ziErQgod5+Ud1wwO+Y3oXCSA2Xx1Jl3T37s8k7JTycYHS+czsw2DF6wJqXGUqQ0J21WM0gNt0mwFP
	pivKO/82gAPCQPFjTRVxZfafOkUK6l47iIuYj1gP0C1zASs9/as9Z6S8KulcR7vYMCOk+smaX9t5+
	+Okr8hFw==;
Received: from localhost ([::1]:65498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgCLc-001zmb-D3; Wed, 26 Jun 2019 18:08:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgCLX-001zmU-7l
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 18:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=9q+5BzEW5hcfUy7vdvqN96YaaFw+IFxbROC55poKL4o=; b=KzBU0echcsuMXfeb15BUVqxeVe
 Pe1LsQsc9xmzGwyHT1twrbBXkJpStxAUo399UGh1MK2oxip05Us0oZcdAjGlj9VbEBiYFxA0lJZe3
 UBG7Emm6JewotzGAeubGNvZP5GJidQIkUEdVScT3M5XtlwRWvvsNPHO4/ldyRxGyAR+c=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgCLV-0003WM-VR; Wed, 26 Jun 2019 18:08:38 +0000
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: David Disseldorp <ddiss@samba.org>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190626181233.4fc61c42@samba.org>
 <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
Message-ID: <f01ce57c-6336-02c3-f80b-c8fa7e1187e0@samba.org>
Date: Wed, 26 Jun 2019 20:08:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
Content-Type: text/plain; charset=utf-8
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/26/19 7:59 PM, Ralph Boehme via samba-technical wrote:
> On 6/26/19 6:12 PM, David Disseldorp wrote:
>> - given that this issue is Apple client specific, is there a need for
>>   this new logic to be implemented outside of vfs_fruit?
> 
> yes, I think our current semantics based on inodes is dumb and we need a
> general fix.

an additional note: from an implementation perspective it would be ideal
to store the additional state in an existing xattr, instead of an
additional one.

We need to fetch the state for directory enumerations and getxattr can
be slow, especially with fuse based filesytems which many of our
consumers love these days. So piggypacking this onto the existing DOS
xattr seemed like a clever idea.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

