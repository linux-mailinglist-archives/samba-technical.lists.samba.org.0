Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE45C03D2
	for <lists+samba-technical@lfdr.de>; Wed, 21 Sep 2022 18:13:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=T++D+xC3+wCgpAK051mMcujvw3lmn0VkExVrTPU5Pgc=; b=PwN3Hbpl93w91UfFC8OHugt5UL
	gelI4ZyiCWCWNE7341B3IWSyu41cz2x581KqxSkZbWPg2hTDiJA/ltEfPYuJDYmM08ktytdadzPp6
	ZsosHxoG5onk1/d8oS9C0U6FPu90EujJsXBLNXthVopT4O7rWWWXQv4mPiXkPxVtBIuywrplXqVON
	jsFh02GFuprbUGNIAleBzMfQpprm49R+32IBMj32ITSj0s2FJdD+/u7gE13rchlJ3XBHWnbXCVMkG
	43D6rVvrmhT4IwBZ7I9Qk91KOF8r6vbmW6tvhx/9eL+QZHtukyvd53tW+dBfnZN3iHtZ5c86coXFy
	RrrfiTOA==;
Received: from ip6-localhost ([::1]:43868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ob2LN-002jSN-6l; Wed, 21 Sep 2022 16:13:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ob2LI-002jSE-IN
 for samba-technical@lists.samba.org; Wed, 21 Sep 2022 16:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=T++D+xC3+wCgpAK051mMcujvw3lmn0VkExVrTPU5Pgc=; b=eciSq4LiCUwRQNHP1nzqptYO68
 FsQv2jHWnkMHwZ5viSdEe0Fvz+uWqm9hCxdVmE+0YXQ42gfq0IkFE7k+jk79yHWAeuyFz53s/LU9o
 o8vdvlN1A9iIocpBKRS5Bd8xFniiQYLRWZp/a9RlSnyIWoERhiS/1VIojhSn+L8L/4WZnReMAbmHy
 D8wuzIqmNF/bejZPFkMW85owFtzJAtyxLLs38WTSzhAjYu33RY9snmtZDbg0Dc6zai9RRNshzD350
 jxMhiv+zeHlOLRpiGQRImXe5mMK15DoGezAihdtX5lB1hIMmTmJpJQvRHf/SGrkHzl0HFi0pStp+m
 NTnWxVqcdHVo6SxLISm3u6S9wwoPFrNhOIOuLtp/Sw/+7vfmDu3MO9HXXpkf7c567DPykTRU8+2J4
 5iROG2+jiInRnb5RBiErLrC/Y8E5ijkB4CmGHhsqwKkyn5BCOR3EvY9L1Oll8q38kRae0WyCZ3EfV
 khaGGcjH8DgHk4SiX31r1221;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ob2LC-001MtY-37; Wed, 21 Sep 2022 16:12:50 +0000
Date: Wed, 21 Sep 2022 09:12:45 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>,
 samba-technical@lists.samba.org
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <Yys3/WVPd/gjBbEi@jeremy-acer>
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyqQ9HtsTM2lmkQF@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 20, 2022 at 09:20:04PM -0700, Jeremy Allison via samba-technical wrote:
>On Tue, Sep 20, 2022 at 10:53:04PM -0400, Nathaniel W. Turner wrote:
>>  Hi Jeremy,
>>    On Fri, Sep 16, 2022 at 01:33:26PM -0700, Jeremy Allison via
>>    This is internal to discover_dc_dns(), so you
>>    could probably add an extra flag here to tell
>>    discover_dc_dns() to return IPv6-only, and
>>    have it skip that DC if it doesn't have an
>>    IPv6 address returned.
>>
>>  Thanks for taking a look at this! I'll work on a patch. 
>>  What's the right behavior here? In the case where the local server has no
>>  routable IPv6 addresses (e.g. link local IPv6 addresses only), we might
>>  infer that we're only interested in IPv4 addresses for the DC, and vice
>>  versa.
>>  If we don't have easy access to the set of local addresses in this code
>>  path, a simpler alternative might be to pick up to 1 IPv4 address and up
>>  to 1 IPv6 address, and potentially try them both. If the test connection
>>  fails quickly in the case of an unusable address, this might be OK.
>>  Thoughts?
>
>Change the API for dsgetdcname() so the caller
>can specify if they want IPv6 or IPv4. Don't
>return more than one address - we don't want
>to double the lookup time for a down-DC.

Probably should be a 'bool ip_v6_only' parameter.
Only set it if the client has only IPv6 addresses
available.

