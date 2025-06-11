Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E10AD61F4
	for <lists+samba-technical@lfdr.de>; Wed, 11 Jun 2025 23:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0PIRnGNf19sOt2olNzTzCCAYfSLB/1mhv7xShvTB39s=; b=depbkWo1lk4Cw1MJZeNwCvel6d
	fpy5e4j2Bt089icwF/uTW+MsebOlYVXApo7ukJe/blMsdFmifsjdDujL1EXDxn/9qzkA9fw+N+g0R
	rxkkyf3//REDy/Wn1KPcS9SdmD2i/m8k1xORYbmzYczvdCq9C8dU5JsFYyeloGNR0hz9UZM1lSi41
	8YNPzH6+HEJcAW6ymbOtYZd+ocVnD3koC3bBIWvjNY+vOE0v3hSblPzekNBkLJFVTszMd4WqvuJvJ
	+TbgB4KHsoYPX42IPh+dP+PjaALuB7Fmk6XMQbc+nt8cFu5zYL3dQjVbAe7qTwOaJJByANnZEj0qn
	wl2WS60Q==;
Received: from ip6-localhost ([::1]:31636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uPTS4-0071eL-GM; Wed, 11 Jun 2025 21:57:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24434) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uPTS0-0071eE-C6
 for samba-technical@lists.samba.org; Wed, 11 Jun 2025 21:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=0PIRnGNf19sOt2olNzTzCCAYfSLB/1mhv7xShvTB39s=; b=cUzylHl9ucs9exzNa/Jb9sVCMi
 kjrqJwTt1VisdFG7/fVlSCir3zatyOeFlMMrEr2OCJJeD+48AbKqKtNlcEicq2EAMiFf2B/bXQmo9
 N8PpR7vuBzj/lsVDZTYFF/hK9UQCFBxBFpF44QA3+dQ605blknEaKXMXQW0UTCNzAlnlzT7AeuNl8
 VBM0ELOFLA8E+Mjgrmx3DBHEct33foUxdU8i8SPCIDGZVr3fFJO4BOuLw6ZopTIcYYOa3e6BtF1Ze
 aUA8J9WplTdwOTnEjm1GfvqWZCDFy8tt7KUNvU16cfsR3IoGkWUXDcEVgRNh26LROXZ9aWtLuQd7W
 Nm2W/7Tz6nziS8Tm92u0xgwo3dNLewB0vwpPKegawJ/WO1vHq09sKyl6ui+CWYFPhgBRT1tihwKUS
 Iwkj93aSf1kxPXoOpiFv8XjzaPtKM+ILVgl/aCweFy9/XDpvpWhMyN5bK1UA/3Ys0aee362PcAFo1
 dt6AT9jgLKW16KrKcDChjtBQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uPTRz-00ADAH-0w for samba-technical@lists.samba.org;
 Wed, 11 Jun 2025 21:57:39 +0000
Message-ID: <5918664e-54cd-42e7-a872-659f63604b17@samba.org>
Date: Thu, 12 Jun 2025 09:57:34 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Authentication Policies in Sambs 4.22
To: samba-technical@lists.samba.org
References: <e7ab3d5b-bc7d-4ac7-b9ac-da587c9e4fd2@kania-online.de>
Content-Language: en-US
In-Reply-To: <e7ab3d5b-bc7d-4ac7-b9ac-da587c9e4fd2@kania-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/06/25 2:07 am, Stefan Kania via samba-technical wrote:
> 
> I now had the time to (again) test authentication-policies and silos. 
> It's still NOT working. In LDAP I see the same entries as I see when 
> configuring policies and silos in Windows but there it's working.
> 
> I think there are only three possibilities left:
> 
> 1. YOU as developer of the function, write a good working documentation. 
> Test the documentation with Samba DCs and Windows clients! That's by the 
> way I expect for ANY new function.
> 2. Fix it if it's broken and then write the documentation.
> 3. Tell the world it's not possible to get it working and take it out.
> 
> About the documentation: For the following new features I'm missing a 
> working documentation:
> 
> - Group Managed service account
> - Kerberos Armoring with FAST
> - Linux GPOs (Still not working)
> - Improved KDC Auditing
> 
> 
> BTW The source-code ist no documentation.
> 
> 

We do our best to make things work identically to Windows, but we can 
only fix problems that we can reproduce. If you could provide me 
(off‐list) with a lab domain backup exhibiting your problem, that would 
be very helpful.

Cheers,
Jennifer (she/her)

