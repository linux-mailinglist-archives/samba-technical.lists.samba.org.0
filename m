Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74264293679
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 10:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vWu0bJMoZYQAh1yn3JxYb7iiguBi3gGRjYbT/L55of4=; b=d0eR57tVZzyX5rWdwDngXUQV6U
	XfyC8mFY+BhLkcX2/IDgFJkPJJQuieyK2mXMzKYRjBRNxeY5Ozoiz0vUAmvo0H0LpyjM2Me6K0K2F
	K/rkJcemZ8RMo/hexIkzBiZAN0xaJ2YQDZNaAmXMU8mnXvz/rFvrKY18Lc9WqdtwPhgAV7oWr1I/W
	wsocrZPkgrHQpJx4pJ4XXROY3Sdx+5x/JnQqUJgPsbb6Nsg3IGcY/3hScsBFHKLDibgix6ULNPYdR
	Kps8nsRNXcfCWV3Dq4XPRcKZ0NZ4kfFlVnzZORVy7xtzQxzmD+ren8+BHpQM3MKVQWTR/E21x03j3
	9T+JothA==;
Received: from ip6-localhost ([::1]:26778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUmhG-00CpQ5-Po; Tue, 20 Oct 2020 08:08:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUmh9-00CpPy-Ay
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 08:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vWu0bJMoZYQAh1yn3JxYb7iiguBi3gGRjYbT/L55of4=; b=ivKl7UHhLt+Jg8F7pSQFoC4Eld
 QRhCrctVjNQILSZIRk3uY/qv0sKFSpR5+OoEZOrP4PLySM/zyKYfd4KvNA5PlmfBUA2kK0NxzA0tg
 8o5o9gvX6z7Vhf9/N8VVqp3CE/AoHzYCc7B8mWh9Z9S+N+X0ZcgtHSKiI8BmayXK4J2xmXC3y/pzX
 qw9MgvZkC+4LjZDqQeCGW+S754MPW9C86F4rxK1OoTA1PY9J3fWjh99VMJp42Bab4RJfUzU+m9TtC
 2N5mYTrjnvACh+tdpRDq3DA0HrZucue7E0uhlkmwJ6bvu2hZv/YWs8LTBG0YGbRunCTqx5hDNq7x9
 57pFX+q8Iu8w/GP3oEVG5F6NyHj7ek4UJbwaDifpRudlQRr49sz9HBBmwxIWFPxfsaJhXqthPygzv
 tkdxIo+CjkzrexjXho5W1QbbRXLsfUPVwyR1Wmzm0b/IyhtDt2EssOHD3Z8WXnjt2yfAFQ+QIz4hN
 LNY5ylUB7/hyss5iAny+P8ha;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUmh8-0006Jp-1I; Tue, 20 Oct 2020 08:08:34 +0000
To: Samba Technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Subject: Re: libndr: Avoid assigning duplicate versions to symbols
Date: Tue, 20 Oct 2020 10:08:32 +0200
Message-ID: <51724103.WUapsaruIv@magrathea>
In-Reply-To: <CAJ+X7mQPg0yGd19pRaXCPzDyr04YEsa=TDDnBj+Gmdt12VdhoQ@mail.gmail.com>
References: <CAJ+X7mQPg0yGd19pRaXCPzDyr04YEsa=TDDnBj+Gmdt12VdhoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 20 October 2020 08:49:18 CEST Amitay Isaacs via samba-technical 
wrote:
> Hi,
> 
> On freebsd 12, the linking of libndr.so fails with following error:
> 
> [ 918/3912] Linking bin/default/librpc/libndr.so
> ld: error: duplicate symbol '_ndr_pull_error' in version script
> ld: error: duplicate symbol '_ndr_push_error' in version script
> clang: error: linker command failed with exit code 1 (use -v to see
> invocation)
> 
> This happened because symbols _ndr_push_error and _ndr_pull_error were
> added to abi_match in commit 42ac80fb46cfb485e8c4a26d455fa784fdd1daed.
> It generates the following snippet in ndr.vscript.
> 
> --------------------
> NDR_1.0.0 {
>         global:
>                 _ndr_pull_error;
>                 _ndr_push_error;
>                 ndr_print_steal_switch_value;
>                 ndr_push_steal_switch_value;
> } NDR_0.2.1;
> 
> NDR_1.0.1 {
>         global:
>                 ndr_*;
>                 GUID_*;
>                 _ndr_pull_error;
>                 _ndr_push_error;
>         local:
>                 ndr_table_*;
>                 _end;
>                 __bss_start;
>                 _edata;
>                 *;
> };
> --------------------
> 
> Symbols _ndr_push_error and _ndr_pull_error are added to both versions
> NDR_1.0.0 and NDR_1.0.1. This does not seem to be a problem for linux
> ld.  It seems to ignore the later version assignments to the same
> symbol as seen from the objdump:
> 
> $ objdump -T bin/default/librpc/libndr.so.1.0.1  | grep _ndr_pu.._error
> 0000000000012afe g    DF .text    0000000000000162  NDR_1.0.0  
> _ndr_push_error 0000000000012973 g    DF .text    000000000000018b 
> NDR_1.0.0   _ndr_pull_error
> 
> One solution is to avoid adding specific symbols to abi_match and only
> use wildcards in abi_match.  This avoids the need to modify wafsamba
> abi_write_vscript() function in samba_abi.py.  Patch is attached that
> changes the symbols _ndr_push_error and _ndr_pull_error to wildcard
> patterns as _ndr_push_error* and _ndr_pull_error*.

This looks fine for me, but I think we need a bug for 4.13 for that?


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



