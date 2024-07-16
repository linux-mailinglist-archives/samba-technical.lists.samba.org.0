Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2FE933435
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jul 2024 00:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vLCq/5AE9qw1VQfocTWPAMWj/7nFSfVOh3U5Iu3Co3Q=; b=VgKRGxjE3sbVbO+vAZ14Vse5TO
	iuzi9vqR7Kk97YPNXuRaJ6h+7RIBZlSX3isikgh/7AWDEiPaAtB8HGdhesUCcmS+pXqe4JpwpCkDo
	ZbiYd0rrvdByWBFj8K81RVGFjPKzBLlNTQpNdm9/iNIpUfUexPLprUgWbhYlCEThPXiCPhAsY9kA5
	hhhGu73LP3uuaMU2t0XlCwr6FD3BigIjaCWrjPFamYVXunWFA2Caqy0KFvqaP3UbDEC2xv1fsmpeG
	Ftfi6yqNseWv0aSAHGOc8FokFRv0ek6qdlqXGQkKHmnlKqhlwsZ8nk/XU1N3Cpk8lhM0TuYFcrZO0
	FAw17SPQ==;
Received: from ip6-localhost ([::1]:55294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sTqdl-000phm-VE; Tue, 16 Jul 2024 22:27:22 +0000
Received: from postal3.et.byu.edu ([128.187.48.33]:43990) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sTqdh-000phf-8X
 for samba-technical@lists.samba.org; Tue, 16 Jul 2024 22:27:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal3.et.byu.edu (Postfix) with ESMTP id E1C5C6E0CF
 for <samba-technical@lists.samba.org>; Tue, 16 Jul 2024 16:08:19 -0600 (MDT)
Received: from postal3.et.byu.edu ([127.0.0.1])
 by localhost (postal3.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wz1ddrR9r9sp for <samba-technical@lists.samba.org>;
 Tue, 16 Jul 2024 16:08:19 -0600 (MDT)
Received: from [10.35.115.21] (congo.et.byu.edu [10.35.115.21])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by postal3.et.byu.edu (Postfix) with ESMTPSA id A16906E098
 for <samba-technical@lists.samba.org>; Tue, 16 Jul 2024 16:08:19 -0600 (MDT)
Message-ID: <64d192b4-8ab9-44f4-a1e5-a62ff5ed0d20@et.byu.edu>
Date: Tue, 16 Jul 2024 16:08:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: Return SMB2_CREATE_FLAG_REPARSEPOINT in create response
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Carson Buttars via samba-technical <samba-technical@lists.samba.org>
Reply-To: Carson Buttars <carson@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello all,

I just completed the mountpoint detection patch I've been working on, 
and feedback on it would be great. Here is a link to it: 3141 
<https://gitlab.com/samba-team/samba/-/merge_requests/3141>.

In working on this, I also stumbled upon the 
SMB2_CREATE_FLAG_REPARSEPOINT (MS-SMB2 2.2.14 
<https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/d166aa9e-0b53-410e-b35e-3933d8131927>) 
field in the create request, and it seems to not be implemented in any 
way. There's not a lot of information on it, but as far as I understand, 
it should be returned if the requested file is opened without the 
FILE_OPEN_REPARSE_POINT create option and the file is a in fact a 
reparse point. Am I understanding that right? Is there a good reason to 
or to not implement it?

Thanks,

Carson Buttars
