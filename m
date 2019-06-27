Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2222D57E66
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 10:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=jlA4ApoO5/iz7N4fd3J83/BuyH3ngypCfAnRxLyMrS0=; b=wv6bVYb0wy4E8o3qd2VVd5T3N5
	F0hjQHIMagiUhIJBz6kLe1FFgnJNB7Mu9jzvZpnqiuAyAZeqONKisoLD+zYGqI7oOhUJPRXGxB5mT
	W24lHKrnz0eEU6Z7mXYWgJtE7GqvNI7tOwqi/6pN305IvsGM7g9Yv7UOFbMvxK33TneHzZKbzx1iD
	d/+mPoodojbFyYD1+qXwrqXwudX16nMsIx9H8ae3dNhRZuWtHKBmv91ZAThP2py8hEtCyJEJooO9T
	5O7hes5bkh+ocJL+wIsmX3WOUBlHCH/mqoF3X1XhEE35VRk6DEjpVl/ymjExCbIn1hU52cTN4go+h
	N1XXg71Q==;
Received: from localhost ([::1]:51402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgPwu-0026Gg-4S; Thu, 27 Jun 2019 08:40:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42862) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgPwo-0026GZ-Qh
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 08:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=jlA4ApoO5/iz7N4fd3J83/BuyH3ngypCfAnRxLyMrS0=; b=swbQLsmV8WI1JLsDIEM6X3bo66
 FwXrrQRf8DgllmyO9eExTQ0SruNajlOrWymy8WC3XWLn7QLtwKhmvXifHruU8pu/lx41b4UTuzM31
 /W68kR2k84Hlpfe4lhhbMjPEoen+XG86hKLA6usi7OGuMMtj9QPzkSjZR5Xt2KO/ao00=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgPwk-0002IB-VD; Thu, 27 Jun 2019 08:39:59 +0000
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: Christof Schmitt <cs@samba.org>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190626181233.4fc61c42@samba.org>
 <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
 <f01ce57c-6336-02c3-f80b-c8fa7e1187e0@samba.org>
 <20190626185113.GA2768@samba.org>
Message-ID: <07782413-8252-f44b-992e-944ba7ddad46@samba.org>
Date: Thu, 27 Jun 2019 10:39:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626185113.GA2768@samba.org>
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/26/19 8:51 PM, Christof Schmitt wrote:
> On Wed, Jun 26, 2019 at 08:08:37PM +0200, Ralph Boehme via samba-technical wrote:
>> On 6/26/19 7:59 PM, Ralph Boehme via samba-technical wrote:
>>> On 6/26/19 6:12 PM, David Disseldorp wrote:
>>>> - given that this issue is Apple client specific, is there a need for
>>>>   this new logic to be implemented outside of vfs_fruit?
>>>
>>> yes, I think our current semantics based on inodes is dumb and we need a
>>> general fix.
>>
>> an additional note: from an implementation perspective it would be ideal
>> to store the additional state in an existing xattr, instead of an
>> additional one.
>>
>> We need to fetch the state for directory enumerations and getxattr can
>> be slow, especially with fuse based filesytems which many of our
>> consumers love these days. So piggypacking this onto the existing DOS
>> xattr seemed like a clever idea.
> 
> Have you considered file systems that store the birthtime in metadata
> (no xattr)?

yes.

> It sounds like for that case we would need to add a new
> xattr for the new metadata.

See my initial mail:

> Existing VFS modules that want to take advantage of the new File-ID
> semantics, must either implement an immutable btime natively, and
> until that happens they have to call the VFS NEXT functions to get and
> set the immutable btime from vfs_default. vfs_ceph already does this,
> but vfs_gpfs needs to be updated.

Currently gpfs doesn't call VFS NEXT for the DOS attributes function.
Unfortunately adding that has a performance impact, but you have to die
one death.

Maybe GPFS has some kind of immutable creation date that could be
exposed to userspace?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

