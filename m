Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 882D46564BA
	for <lists+samba-technical@lfdr.de>; Mon, 26 Dec 2022 19:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6i+KjhTAi/iJtsvO+G3mTORwzK29MWbOIoBXMTkJVCM=; b=HLLtGbNJ4syqQ0TE3olv1ajWji
	YYZdAjRvSS54cVb9QWIXXgp+ixwxrZdELuHwlJ24k1P95nF0XAXpoDWC2n9Fi6YZjKMN+fBxttWWQ
	l+E2ohpcA8C36I4jnj+uqdJRCDoLtDMrZ22Wfmkm63BAXROlPtncxZz/zI/yvc8td9kFmK3BqYoB4
	j4VXJQIBFAm9I6gjSoUVh4r0H5HxwQ5jyVIFI4CwpFPIfnz2767majafWW1dLsKmID3JW89MIWsoz
	tLuZZGN5vbzUwWE+aPOB0aI/crrGtNqJkiDOzarKBQZV5KM/RPcoKvD7lOp6YhVysOERKkeiLwwIy
	v/MLfJZg==;
Received: from ip6-localhost ([::1]:57756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p9sgH-00BVdp-KY; Mon, 26 Dec 2022 18:58:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53972) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p9sg7-00BVdg-3d
 for samba-technical@lists.samba.org; Mon, 26 Dec 2022 18:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6i+KjhTAi/iJtsvO+G3mTORwzK29MWbOIoBXMTkJVCM=; b=GvDYwnQXaFgJaKOR0fwo2DUTRi
 bJSoSICaXXwtCnz47BFvB7NN/pOmmAUAjBw75nTzzz89Wm5EFRfqDcgzJqYI217V+smS7IHA9vPlq
 j0Z6D3UMgl7OYupYiX+I5IhnajQsaR/Tbty2Iql/cr3z5LB/UBdYIWi9HPMGTvBJEGJ/HvAg99zie
 zdqKd3VpYC6AEamr+7dGhKwzH4950EVucdthAIlN35yCNCfCAS47VwaiwDuxZzs0Phtsl3yNyQoCa
 hjgaW9CdumzJulvNvDnRRT3BViSkIzPFq5/RWgZWhuPB5zYk/nCvZDJSbYSc3adABnt6ktP+b5c4l
 HzOQbkDhkQCWzk38/kAGf0C5gSHhyIgF7XbXszYyznfmIHC6bl3o4Nf63O3+C7XmJ4KcZd6HUmFI9
 Gx4knjoylmj/aFDctZR+AEChP2Jui/77xVJwMrjcETkWGi3Zmq76FJ3WN7aHeUWQkFrtu9NINiSJt
 obfSjxIubAx8tRcQQYuGtogN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1p9sg5-005YBK-41; Mon, 26 Dec 2022 18:58:25 +0000
Date: Mon, 26 Dec 2022 10:58:22 -0800
To: Dachshund Digital <dachshund-digital@dc.rr.com>
Subject: Re: [Samba] What is the correct process or procedure to add
 functionality to Samba?
Message-ID: <Y6nuzr8e+aqloMQP@jeremy-acer>
References: <0614cfc6-0095-0f36-764a-52f1751fd774@dc.rr.com>
 <Y6kx2nCjLTAcuFOM@jeremy-acer>
 <145f90b4-4494-396d-112f-88a79e032305@dc.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <145f90b4-4494-396d-112f-88a79e032305@dc.rr.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Dec 25, 2022 at 11:52:35PM -0800, Dachshund Digital wrote:
>Jeremy,
>
>Thanks for moving this to the right list.  Hey, if there is a better 
>way to implement the idea, so bet it.  I was just thinking having 
>Samba call back to user defined scripts would be the most user 
>friendly or flexible.
>
>The key thing of course is the idea, that Samba is a bit smarter, if I 
>can say that, about handling when the backing store has issues or a 
>new one added.
>
>Editing the smb.conf fine for a static environment, but often have the 
>need to setup a share, use it, and then retire it.  There is no, that 
>I know of, dynamic way for Samba to do this, no CLI or published API 
>that double be leveraged, or is there?
>
>I have used Samba for about, maybe 20 years, and have wished for most 
>of them that Samba handled the backing stores state/changes with more 
>elegance, then editing a text file.  :)

Well there is the option of registry shares, which can be
added/deleted/modified using a command line script.

Doesn't this do 99% of what you need, so outside of
Samba you have a script that watches for backing
store availability/problems and then modifies the
registry share definition accordingly ?

