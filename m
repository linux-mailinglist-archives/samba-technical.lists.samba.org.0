Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4248F1C1C84
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 20:03:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qUSheV/auGMps+XCNZpoUSvIUldqQoYFm4/OM3zFAOI=; b=RX/NjUhHKQ1Gcjjq0Rj3ndzyZf
	Vzp4HDi4Ue2vmUh5VIY7nJUprNK+ooUyrS/lzYtsCSTSuPjl0P5+4DKkQXFBZw61I1SRH/EMZxnyw
	XEFCUdcFTxnVX8JTPgvJzlCV1x36914o6HJzL3qDeNa48aa/ZPUtaPfAjRbgyqfK509oNtQJ3PtsC
	edCGygfp5+Nq0F6fw4cfe95ChPCi4w186B+EAFhmcMA5kLa79ZIbKCCEx8tydLi7J9BP6WCFXDn1O
	MeCilu9Xr+p7bba4VRgzOskFYmqd6kp0JbyYfmnDKpKuZP3rmE8VH0V8SwwQ21LgDh/0zOq/y1H4u
	EU0T5EOg==;
Received: from localhost ([::1]:22020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUa0N-002DJr-TX; Fri, 01 May 2020 18:03:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUa0G-002DJj-15
 for samba-technical@lists.samba.org; Fri, 01 May 2020 18:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=qUSheV/auGMps+XCNZpoUSvIUldqQoYFm4/OM3zFAOI=; b=IGpTBI3ADar3YwvnNeth02CFIX
 XuQFrogNl9zl1o2S7q5ElX5vlsNC6tG/tvlDD2TJiQuGyWB6idWHTYSYmc3qqU7A4At8TpwqRn97G
 fn+jWOhhxpPDg5bSmcfK3K972oX9xW0GTPIBnyqZm3j9rGMhiYxxO0Pp/QdzL/XHmHMQg+NAvSMLy
 wcNffG8+NzWe/PhNNa/ZwPMMlLcQ3kUbaNf3LoQOWaw/BtkKHMAHkbXZlj4IzshyZh/f3NF0Fwfon
 FlqA/5f9Lhe9CyROyGHgI+ZlqXU2tbIcinVlIoIX/xMikPF2IvpbX9T1d5kZRTOSwzscoC6MwMTPY
 GSU2UGhpALEAlFjoEHgxnTTgOGYIDDiHIgkuBtJCZGkXXg+/puz5S/K2GllbDP4uI2PFXWBGU4Itr
 wG6ZU5kKi/Hgz7fhnWknGGpo6PDd72ZBr+j+AyDQ9ZV3ajkca0C4aKTBHINrBRtv0L3seVeUTGoMd
 1aY3U0doYcmqUSoi7Nj9U+g1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUa0F-0003dq-7G; Fri, 01 May 2020 18:03:11 +0000
Date: Fri, 1 May 2020 11:03:07 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: Windows 10 client opens a folder as a file and asks for SMB2
 GetInfo SMB2_FILE_STREAM_INFO
Message-ID: <20200501180307.GE29166@jeremy-acer>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer>
 <bfc78e2b-09d9-1e38-1e73-700969f50919@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc78e2b-09d9-1e38-1e73-700969f50919@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 01, 2020 at 07:00:30PM +0100, Rowland penny via samba-technical wrote:

> Hi Jeremy, could it have anything to do with this:
> 
> https://bugzilla.samba.org/show_bug.cgi?id=14101

No, that's a libsmbclient bug, not a server issue. Thanks !

