Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1017A07E
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 08:23:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=7LlKZsKeTA2IxbXZ89M6ig27fJjrtsvHuEFyUWvlDFg=; b=D2JNjJizYHgH/rCfHMQkwXpunL
	Hw4qLdWghNxyuENOY9eIaevVbTLF1gBJkz3Q8clHYSyGKPJ2/dINXoYtwj7Pmul2/zYSfGyv4/7P2
	fREU81JLpkf455TlD6azmBaUbxMfy7cmCbMfyrTo1m/ygP8PCTdT8CRffLqVHNij+8wevVs12w2qo
	xyhcyQROPMedq4hZX2Kef1VTC2dlirZBdkcrd5oyg9lK4zGhcNyxrwyNV8hw6A1LvwMYA8jaQ2XaG
	UGz3xA/Fl6q8hKwfcy8cMDivO2LQbm4k8JH1O8StUQOVIYNUztQ/xI/CNIZUc1Y0ePdprOHZwZV06
	Kta12stg==;
Received: from localhost ([::1]:20970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9kqa-00F0eU-Va; Thu, 05 Mar 2020 07:23:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14804) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9kqU-00F0eN-Mi
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 07:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=7LlKZsKeTA2IxbXZ89M6ig27fJjrtsvHuEFyUWvlDFg=; b=oF7lvdas+u84QLZ5j6ZKvMFQCg
 ax4RlpCu/kAWu6ojzex27H5H257DrxI6f4PH8RwiZtsUEihI7nnfkL7A3fRalKNCQt4vee0zt1rB9
 5Zlp3y2a9/itCamnX8IPf9G0RTPghk0EueQQbSxQgV11ullP3lZx5a7TuVA/rDtVWb2XCrrVF0DQX
 C9VCFlz62TQnqdj3Lhx1y4cCfsCfIEJKi2hC8AnkpgaEO9hVToqeF1jM4g8tJQGIeqhb633C7conP
 ACDNsw7jewl2s2/VYSRVJJ8a+gSMfv3kmjsIDy+aWmJS85G5WDCfnBdd0W9Aq4DGImSnscvwy5kGW
 g94ONfZOJ3mxUEakXNZJf90bePgurLgs/fMZhSPuVZOsu1BX7/5ofE7nPka7KM1KkF8A5aFM+3uD2
 MihWKsTAdEjWQ4yEXHnED9OCaUQqVmPWXqg18/kyTrs50UnVkCNt+aRhyI3PpQRdGo2HwbmStBdB9
 1qM3jLCbwSTuO2iVjcyyzK6Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9kqU-0008N0-4J
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 07:23:02 +0000
To: samba-technical@lists.samba.org
Subject: The new bytearray.h
Date: Thu, 05 Mar 2020 08:23:00 +0100
Message-ID: <14402554.CL861slAbl@magrathea>
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

Hello!

TL;DR: Please use (PUSH|PULL)_(U|I)_(8|16|32|64) instead of e.g. SVIAL.


You might have recognized that we have a new header called lib/util/
bytearray.h. The file will replace the lib/util/byterorder.h.

As other code I've written bytearray.h for libssh originally. It doesn't 
depend on undefined behavior which byteorder.h did. Yes, libubsan complained 
about code which used byteorder.h. The byteorder.h has been change to use the 
functions from bytearray.h.

Also I followed the naming form NDR. So the function names are for example:

* PUSH_BE_U32() to push an uint32_t to array in big endian order.
* PULL_LE_64() to pull an uin64_t from an array in little endian order.

I find those names much more descriptive than e.g. SIVAL(). I never know what 
that thing actually does until I take a look what the macro does.

Please if you write or modify code, please use the new macros! The plan is to 
get rid of byteorder.h one day.


Thanks,


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



