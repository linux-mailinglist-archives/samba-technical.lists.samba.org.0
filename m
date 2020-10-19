Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCEA292A89
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 17:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4WE5RfI7AAV+GgOr3UYUMXEckzSshC0y7WabcdHj85g=; b=4nKmDIevzWQERwPRhtf+nesQ1y
	cl5gD5Q8/pxWj1HO2CNyyc+TL3l439xhgwTnjQbXf8AS8bIZnPnA+Sd6ecVfvZeIxJ4E80Lq6m72Y
	aG7H0DQew5ZbzaerferiJOEe1/gr1YK7t4P9ieO0XY5xrnbKhpvI3L5+mzJZ+1SX1isu2UW3GcNuf
	6jDERBywc5QHwKyL+4M6G2PQneHOQ71ppV3lH/r4CgnXJpOvmsSADnF9AzFSkPtg3mDnrAMOXdk65
	du+H8n92nBXHBvK1jsRaiUGhfOvBqwuzWyfTVI48oFL3ydM9/hbTNnEl6Hz1UUBycAzB2dZBfGxCM
	WN5HxDSw==;
Received: from ip6-localhost ([::1]:55230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUXCs-00CkBJ-VO; Mon, 19 Oct 2020 15:36:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUXCo-00CkBC-0t
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 15:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=4WE5RfI7AAV+GgOr3UYUMXEckzSshC0y7WabcdHj85g=; b=fGzmDRSnNX7NTut6Je+O+iESIP
 kkGW2FuUkEbcnNXX5A7NxeryFR+fYutsoSI+CZcoAw36I7O3ZUjxuNsBJhza4fHC8aEpY5I517s4i
 TnHrMPnE+pveA+bdusycoNK0JlKtkhlrzAACzfPIkK3MpsqW6g+QpfVBrO4fP+NnYyW6tpFsgsOCj
 EECpe0AltwaAOCH4P+uEIeoECnmlVsXxa1kL6IFz3B0HeJqG6xrGlvRzD+krCL4wgDyAMs+4MKJET
 EOtbSjYnULfffEkQrR17Nbjbig0yJ36Flxz0WcBnHL9/JqUTW8TmBQ/cPMtFxcnxEykWfCgvCcrDx
 ghhwb7gDYX5d/VxDwAFW8uFu1fn4WgfFVf8VBzRVb/YwRH4ZpGl8FGQA4odslGdbvnid6RmOIqH9g
 0rtfpXXoFjpjxyF7Yg79FKdNWx4ca64g6re6g66c12abVH3l6+tQ7RSCD1fwshLwmK7Ag0UPJp5d/
 kG3AtrbR0aT+C5eHDnw+9uDr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUXCn-0005G4-3Z
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 15:36:13 +0000
Subject: Re: dns.keytab file
To: samba-technical@lists.samba.org
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
 <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
 <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
 <7214e13f-009e-5022-cd93-b7f0468c87a7@kania-online.de>
 <37aabade-4f82-1783-7cd3-53fc12c48308@samba.org>
 <d13637c0-cfbe-c49e-6d1b-3e4c12d02843@kania-online.de>
Message-ID: <bed333b4-1f36-bb10-5de9-4833a68ebe3b@samba.org>
Date: Mon, 19 Oct 2020 16:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d13637c0-cfbe-c49e-6d1b-3e4c12d02843@kania-online.de>
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

On 19/10/2020 16:30, Stefan Kania via samba-technical wrote:
>
> Am 19.10.20 um 14:30 schrieb Rowland penny via samba-technical:
>> (does anything rely on the dns.keytab being in the private dir ?)
> I think not, and setting the permission to disallow bind-user to access
> privat-dir is ok. All files needed by bind9 are in bind-dns directory.
>
> Don't forget the second part of the bug ;-) the wrong permission of the
> bind-dns directory.

I created dns.keytab in the bind-dns dir, but it went pear shaped when I 
tried to change ownership etc :'(

I think I am going to take a rest and then come back to this tomorrow, I 
feel that I am on the right path, but it is fighting back at the moment :-D

Rowland


