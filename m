Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3039E6DE241
	for <lists+samba-technical@lfdr.de>; Tue, 11 Apr 2023 19:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=apjA/uKtgCkK90VMCe9X7Bg/4Pygg/wfyNk/yg0RoGE=; b=H3HkLciz2NMISSFiWIwq5UnkKX
	NDio0Y4O3NsfsRJSH448HlK2xIkTKR9+h4+yHSGiLSa1FfcZlecjiLvG084g8FpxIlgRLyi3kdhgj
	n7QKbt638og0kpDUWvJq5GH/zjbFj0BSIiX2KygMmkrCd9XDwAuiz5orHqyqyiljJ2UTWX3SboPHN
	bsSMqJ766NU1Mz7Yh3l9DFfIiqqEjJOV3ZIA5RFOWCMYQAQMj6naQ+skvQZpn/M3/KCnq3uAIIulo
	3zoxw/5yZk2IvZMz5Z4GIqTuVOJsvxtXBQMTct+gcN0FwIZle/mnRZAnWM56EdJtXwlL1NrG3f68M
	ELMtLF4w==;
Received: from ip6-localhost ([::1]:63402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmHbD-000P5X-9u; Tue, 11 Apr 2023 17:16:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmHb7-000P5O-HZ
 for samba-technical@lists.samba.org; Tue, 11 Apr 2023 17:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=apjA/uKtgCkK90VMCe9X7Bg/4Pygg/wfyNk/yg0RoGE=; b=U8CvputYAFDw6O57VoAZgblQUb
 9vVW/Kqm6YuPIJz0d0JnvUFkTV0qzNfnDbWONUXexAnOePeoOmSbpEPZFSiKxYxWR870ilrDcgnEP
 fZbTX/xbS3zhpNqTKesFeZ3hjqezCyZSeYQg6HnmjdF1YeGB/k1+FTWzGOvbSTZ1E4TFkBXLR8A2H
 1ebm6pxX2f7B0Tzt3dHza+kiwJGw+2hXBFGFf5ZnUTELh262owPx73Kohng3e0cSQAKSE1L5+Fxlz
 AOv1+X9iIEeiHGqUE2GVEoueQ6kpYgxohvLVZn6x6zLD3FyD+1Oy+e4IldoErAq4uGVxvLo7TFUBO
 UeFMgY0VkdjQZWgoUkF5Aon2YSnwcRRzDpIym2qCHXEAdX/OZHpSx2dPd+aH5pAACgrAyJ2dDnllU
 EEZlsoJstHFCqquTY0Ue7BMyNlFtMwEG10V+EXcpbShSBwpapLrA8T+i2PAMRA/6LQovHP8IN5MaO
 QNnkBy/XhSvK6UNmHLtMxSzc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmHb4-000UvZ-Tp; Tue, 11 Apr 2023 17:15:59 +0000
Date: Tue, 11 Apr 2023 10:15:56 -0700
To: =?utf-8?B?SmnFmcOtIMWgYcWhZWs=?= - Solaris Prague <jiri.sasek@oracle.com>
Subject: Re: Recent Samba (4.18.0+) winbind configuration ?
Message-ID: <ZDWVzOaPP7SNIxOf@jeremy-acer>
References: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 11, 2023 at 02:32:27PM +0200, Jiří Šašek - Solaris Prague via samba-technical wrote:
>Story begins when Samba 4.14.0 changed its VFS so we decided to skip 
>4.14.x and also 4.15.x releases to bundle it on Solaris but various 
>problems were also with later releases and we were only fixing issues 
>in 4.13.0 . Currently (4.18.0) the situation can called be critical so 
>I focused on recent release.
>
>winbindd is giving up and I think the key could be in log message:
>
>[2023/04/11 11:28:53.090661,  5, pid=1525, effective(0, 0), real(0, 
>0), class=winbind] ../../source3/winbindd/wb_lookupname.c:
>52(wb_lookupname_send)
>  WB command lookupname start.
>  Search namespace 'smbsetup' and domain 'smbsetup' for name ''.
>
>...where "smbsetup" is my domain  ...and I have added core-dump here 
>to freeze the stack:
>
>[2023/04/11 11:28:53.090780,  0, pid=1525, effective(0, 0), real(0, 
>0)] ../../source3/lib/dumpcore.c:315(dump_core)
>  dumping core in /var/samba/log/cores/winbindd

Jiří, please open a bug and upload the full backtrace.

Thanks,

Jeremy.

