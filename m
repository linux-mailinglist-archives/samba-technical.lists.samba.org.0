Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8E1D87BD
	for <lists+samba-technical@lfdr.de>; Mon, 18 May 2020 21:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dpPk+5DJfKgjB71SAL9C1eXuCBeCilAc/nuGtogJEnM=; b=grOf1loCECvQoZfjWOuF0Dvi09
	s4PgvMrBnRGRcLkjzQSQdY3M95UWhoktl9iwHFDuto7h+5jhGPujYT+cbhg+q+b3sffPIwFKySxUF
	6wF/4Ntl9AwwmqwFWQ/btwub7+j7kDuX0HvLb9R60AR5WJt4W6yj5sDAfqW3peZtoA4ELxrYXO2ZO
	obf2hEhH+WULKdL7Wi3SWFKh5by8Wyx+kFnLvS8rDfd40Ai5t1BkRImocSZFLHBbRMXjnywrlTwVR
	+mYcZildBYulANaUTdp32XnaV9uWn5rcQMixGqWnR5RAhtnQqIkr0TV7t+69NWuyYW0ZliSPtIRVk
	zdu0QZPQ==;
Received: from localhost ([::1]:24710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jakyq-004yFW-MG; Mon, 18 May 2020 18:59:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jakyl-004yFP-TV
 for samba-technical@lists.samba.org; Mon, 18 May 2020 18:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dpPk+5DJfKgjB71SAL9C1eXuCBeCilAc/nuGtogJEnM=; b=bhI+H/yMhC48b3v89SCa5CkAKO
 2usOa28ocKiGHiQzHFtucGSjqheOJvT84zHqoW0TTYsKLLdO/N5GpSaoVV+7mNBywrMqt0c/aANf0
 mIzNyw/cPN+Eo34zyodqpYZ/DId+r9F2crn9Jn8iyPpE8v0nOBSWK2LgT3/psj2FS5ENuF56AKdFW
 S6chsnXOmI1gtmf/v3EMoGNzuLHT0me7ZlwRJVFZJIDeWnb2VnWMX3ZmYK69CgXdR2gSMP8qu1fBr
 Rc3cVA95nqUqpg1DdbIDcvagm05MWpTX35iuF16gsSzPGUAoFyymuA5P48x8JQ6QSfw/VPINTf5dL
 pJpO9c1XrzpnDbJhJM166Zi6ZBlvBUTId8lgu9mtr5FwvdzmeNymOiRqXN3mnWMF9tiAQtk3ajXwr
 wyxWGRTkugoYGYIgNvKzGiwePOYgHfT3ze59UxeuNauAXvJtYTUc2pvTXwxzF5vdSqH/Puwqrxy7N
 CkvwF2utYT72qX8dEnUB3I4x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jakyj-0004rF-NA; Mon, 18 May 2020 18:59:10 +0000
Date: Mon, 18 May 2020 11:59:03 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200518185903.GB30317@jeremy-acer>
References: <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
 <20200514075904.GA150211@samba.org>
 <20200514174533.GC13942@jeremy-acer>
 <20200514232614.GA483587@samba.org>
 <20200515004712.GA30423@jeremy-acer>
 <0ea0253023c276aedf3b2eb162a9907cdcf08092.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ea0253023c276aedf3b2eb162a9907cdcf08092.camel@cryptolab.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 18, 2020 at 05:47:00PM +0530, Anoop C S wrote:
> 
> Seems like we have two different mapping methods.
> 
> When vfs_acl_xattr is used along with 'ignore system acls' we have
> special kind of treatment as follows inside make_default_acl_posix():
> 
> if (mode & S_IRUSR) {
>         if (mode & S_IWUSR) {
>                 access_mask |= SEC_RIGHTS_FILE_ALL;
>         } else {
>                 access_mask |= SEC_RIGHTS_FILE_READ | SEC_FILE_EXECUTE;
>         }
> }
> if (mode & S_IWUSR) {
>         access_mask |= SEC_RIGHTS_FILE_WRITE | SEC_STD_DELETE;
> }
> 
> This might be the reason why smb2.read.position is always passing with
> vfs_acl_xattr + "ignore system acls = yes".  

Yes, "ignore system acls = yes" special cases a lot of stuff.

> Here comes the default mapping method, invoked all the way from
> smbd_check_access_rights() we have the following in
> map_canon_ace_perms():
> 
> if (directory_ace) {
>         nt_mask |= ((perms & S_IRUSR) ? UNIX_DIRECTORY_ACCESS_R : 0 );
>         nt_mask |= ((perms & S_IWUSR) ? UNIX_DIRECTORY_ACCESS_W : 0 );
>         nt_mask |= ((perms & S_IXUSR) ? UNIX_DIRECTORY_ACCESS_X : 0 );
> } else {
>         nt_mask |= ((perms & S_IRUSR) ? UNIX_ACCESS_R : 0 );
>         nt_mask |= ((perms & S_IWUSR) ? UNIX_ACCESS_W : 0 );
>         nt_mask |= ((perms & S_IXUSR) ? UNIX_ACCESS_X : 0 );
> }
> 
> Thus an existing file created without 'x' bit will end up with a
> access_mask without SEC_FILE_EXECUTE.

An access_mask in the reported Windows ACL, yes.

> Difference in behaviour is because of different mapping methods
> resulting in different access_mask when used with and without
> vfs_acl_xattr. Why is it so? Why shouldn't vfs_acl_xattr just deal with
> setting "security.NTACL" with a value obtained out of a common mapping
> method?

It's probably so due to historical reasons.

Can you write up a comprehensive "how I think this
should behave" and then we can discuss, make changes ?

Thanks,

Jeremy.

