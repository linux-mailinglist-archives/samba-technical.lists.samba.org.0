Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD588B5FC5
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 19:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bncNqXgXCpJGC21nf13YlvWBd9X6qTFWkwmv5NuypZA=; b=uEA4c6fXIPMaaZkCHL0uidbS63
	RuzQxHc43vKQw5ickyhdaibxsMs2Zv+zet+XVCHM2kPQX+3SY5uaC/+9ljRyXxtba7nDjgn8uKTyM
	/wXDGVAmSk5r9COOaHC7IAeNWmxs9OQPX9aTg30FNSPfqkeejJl6fE8KFfKkMlSGtEx85fXXdGoSS
	GFncwaW2G2ESyOvlhKFVOhBRY6R98VCWm/j7CMBCY4IBFV7wlkSk2UsVPAYGv6FF9L+sd+OubyiIN
	s948dQCTeMSkzmsjb7r4pbl8IQWLIKIE4FPAvKDC2Dea/5Kxe9yfm/U7WJ2bB4BEZ3b4r6In/oSOa
	l5+F/Rxg==;
Received: from ip6-localhost ([::1]:55542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1UXf-0061LJ-2J; Mon, 29 Apr 2024 17:11:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60408) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1UXa-0061LB-CF
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 17:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=bncNqXgXCpJGC21nf13YlvWBd9X6qTFWkwmv5NuypZA=; b=DxWBYpv8wsh9VNqp5VoB8DlCbs
 ANruOuS7EeHGrzTiDG05Babth+H8aTKSSrT4/1yzGnzPFdFRMMnbip11umiHNxyDStOUBDOKANYo1
 7ELKrPHdVX+U6DDRFa6GxrokeBlPbs6BGH3zTBE+aUVPT8k0VbftYanzX+Z/T4KTanhwcA+ocQleE
 68B1TAC62pPX865wJkKyh4UytS8/U3vtvyJnw6Sylc6Ob3dG1ckzH/gRBVrsr4q8YueXwqU1OqRal
 jElNQiEzJUlPE+7wXnd3/5Li6nqu2RgsKF6Lz6T1TlR/1JEyTEomViAroYuJw/WC2wQM5fzRpbg7Y
 y3tHJ1jezcSYLL2lSWRbNhi0kcggRCEM762Fjy+40E6AAsWN6VGCz35U8KyiqLGHZn3xtIHKbfBSg
 VmH7f+dfnJ0GxrcX0jl2MILQ41K97nazcMmmFJ1UG6ZJiZ1U/R8b7Q4EzYryGvExze6/db/mbvYy+
 POgxU8oGmv8d4Fvu0/3VDOOZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1UXX-008yIC-13; Mon, 29 Apr 2024 17:11:43 +0000
Date: Mon, 29 Apr 2024 10:11:40 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: query fs info level 0x100
Message-ID: <Zi/UzF/guANa02KO@jeremy-HP-Z840-Workstation>
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
 <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
 <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
 <83480311-74b1-4ee6-be85-5b21b0f55ee9@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <83480311-74b1-4ee6-be85-5b21b0f55ee9@samba.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 29, 2024 at 06:44:39PM +0200, Ralph Boehme wrote:
>On 4/29/24 6:13 PM, Steve French wrote:
>>But the (current Samba) server fails the level 100 (level 0x64 in hex)
>>FS_POSIX_INFO with "STATUS_INVALID_ERROR_CLASS"
>>which causes all xfstests to break since they can't verify the mount
>>(e.g. with "stat -f").
>>Nothing related to this on the client has changed, and ksmbd has
>>always supported this so works fine there.
>
>ah, I broke it. Fix attached. Really embarrassing...

Double embarrassing, I +1 reviewed it. So sorry for the bug :-(.

