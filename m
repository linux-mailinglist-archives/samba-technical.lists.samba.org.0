Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C232F7A2354
	for <lists+samba-technical@lfdr.de>; Fri, 15 Sep 2023 18:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dx80Wx/fK2UzUUnU8vzOzz4oa/prOb9StBrdWfIJD5M=; b=ZlZi3kxkoSsHupBzFLh/sm/t6o
	ODqiT2uytG1XYyKvUivEehwP+njmUI3dff4g0l4zoNwJi4EDvcAlooh7VxQDAu+1AtUe6RWeF0sfz
	ZB0m+rsvWkpMpIFg5xbA8oHMrp9aIW2tS+TAxhCIi6m1jzAthI3XeYdKlL208oVHp2h7WhVx/9Dzi
	x1CNjlKcUAXb8V73n7GqQ8LJb71v0JF0Wr0zt2F2rISWjw6J7uLnj9BflKTPS8i4iINO5Fh+vDPnw
	ZxNAVyIOGiBYICzl2OoxXSI6l1vivwe08YAB7DDUsFkQFzJ6NZ+7aYvnSzRQrPwzq6wVzQT+IxKPp
	nkhfcoJg==;
Received: from ip6-localhost ([::1]:27362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qhBPV-004kOK-Gp; Fri, 15 Sep 2023 16:11:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33508) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qhBPP-004kK8-5u
 for samba-technical@lists.samba.org; Fri, 15 Sep 2023 16:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dx80Wx/fK2UzUUnU8vzOzz4oa/prOb9StBrdWfIJD5M=; b=IwTX5FEC2u1IYenZAT4nbyfWZ6
 1jf0aSv4uZoflcEeQ9qRJLA33lllV/1B2siV7S/XDQTiNW6XOiTYRQOFpMQYfan3yOvDa1nyjjD3d
 IYIgHAZgkG6ltO2HrzNJXL/A1E24JDhkBsYChH2aaMRjfhzVpgdbxoC+RV0b7AJuPJhm3Vn5Kx+v1
 9iW8vtXojPtUk0jgZCslYh+J9E8vpdodzIz1rFEMztATlYayk1/Xs4+RyO4CC5XmGicJV2xAJq7Su
 nRx88xgfW4Uf4DdU6aB0KwYYbNjC61AgFxDYJteKtbvZatMfobdb822B4jv6Nl9Ij7jeMdny1rJ4g
 EVkI8ZCTzikmRwimJgh5vXeyeIUMs8lQkWbjfEti/3j3VU8ycf8wANkckkqM4FaltVSS5HiqQpEpK
 wdNkwIPlvwPWFNQRuKwptM/WNCyIBXuakxnH2uBsURt1dGLx1wYXwrfOKClTPpI0DrnT5jd7D7adQ
 lWMUYTAoJPsOAQEIBwNCyvxj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qhBPM-00Dhzh-25; Fri, 15 Sep 2023 16:11:05 +0000
Date: Fri, 15 Sep 2023 09:11:01 -0700
To: Christof Schmitt <cs@samba.org>
Subject: Re: fstat on Linux in glibc is slow !
Message-ID: <ZQSCFQcY/pdbml82@jeremy-HP-Z840-Workstation>
References: <ZQNVAogyt9Wfmje5@jeremy-HP-Z840-Workstation>
 <ZQR+SazJv95XzrdS@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZQR+SazJv95XzrdS@samba.org>
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
Cc: metze@samba.org, vl@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 15, 2023 at 08:54:49AM -0700, Christof Schmitt wrote:
>On Thu, Sep 14, 2023 at 11:46:26AM -0700, Jeremy Allison via samba-technical wrote:
>> https://lwn.net/SubscriberLink/944214/ca0c0f366ada686a/
>>
>> Maybe an easy performance win if we use a replacement
>> for fstat until this gets into glibc ?
>>
>> We use fstat a lot and assumed it was fast.
>
>So just call syscall(SYS_fstat, ...) in sys_fstat? That would be an easy
>change.  Demonstrating that this has a performance impact would be the
>difficult part.

Yep, that seems to be the fix (for x86_64 at least).

