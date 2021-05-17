Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C68383B18
	for <lists+samba-technical@lfdr.de>; Mon, 17 May 2021 19:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:subject:cc;
	bh=byUQK97gkLr88p6+ATVJJNy5okHEFadwJ+7SiHEvyhQ=; b=KQKjC74I+rEPy9KTamIgpcP4FZ
	tfU3pF5U7x6thl5DdV6ieh7HzH28rtKp3FoRL57tFyv0hY0Oj03PgTdL8JLWC/nRMFf8kI7VshkEA
	e2olt3uXCyPoRLGabsWffkYm2hQEBXiW7fuPsb7n4IVEjPMlRj0lfAchN8IMIRC5gMTvrNdenw2uw
	4GTh5OlSbZT9fDzfMwAFOzFSU7dUhch7czhsSRnLCfCc9H/xHnV1W1ZxZjdVCKQreRb8D+gXe5YyI
	zGLRRr7yP0r2UgW7DeeCsFt0KLFb6qDmsIRLPtPQ45LPcSXZLVtuB37neWD9cwdzxHFslmX7rlbrC
	9x6YRPxg==;
Received: from ip6-localhost ([::1]:28568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ligt4-000xij-9p; Mon, 17 May 2021 17:18:38 +0000
Received: from mail.itsd.de ([80.153.216.99]:11132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ligsz-000xia-1n
 for samba-technical@lists.samba.org; Mon, 17 May 2021 17:18:35 +0000
Received: from mail.itsd.de (mail.itsd.de [192.168.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securemail.itsd.de (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Mon, 17 May 2021 19:18:30 +0200 (CEST)
Received: from nero.itsd.de (unknown [192.168.0.220])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.itsd.de (Postfix) with ESMTPSA id C51A8800D6;
 Mon, 17 May 2021 19:18:29 +0200 (CEST)
subject: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: samba-technical@lists.samba.org
Organization: itsystems Deutschland AG
Message-ID: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
Date: Mon, 17 May 2021 19:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=itsd.de; h=from:subject
 :to:message-id:date:mime-version:content-type
 :content-transfer-encoding; s=default; bh=btvdxeYim/BbFtSWH8UP2N
 kdBykCSzGYNK8IB1NHLWk=; b=A+pxmifqau0KnJaxRBW01jFqkssQaG8Sq5L8ti
 k8Hzl0FqOh1eN+R4cJ8ayw1r9tQgxFDgpJsNVJwmDfUcprsSnnuWqKyEBq045X8x
 D8pSrehk6XRpBK8dK6nd+JFiAgS+MMSsYI1mp+XNqvubsXARmSQ3wbbbH/iNqutP
 niAQDzLFv+jVyuKZwBViXdkComWEcqzh4/TOSsJVMVbnHhtGL9pydqOPa+tCQY2j
 hNaW3YPElBZVXvuSQYmkSxns1H8Oz2JBUpnWOT2xNJDpF3e5NJH2f0WSUP1kzRZG
 fmbHskwTfG0AfvZlPRcRGdLmu/XyL0Vh4jUW/0ENi2YCBr8w==
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
From: =?utf-8?q?Dr=2E_Hansj=C3=B6rg_Maurer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

  - sorry for the noise, did not find the "plain switch" for our mail 
gateway -
here the original mail (hopefully)
samba 4.12.3 on CentOS-8
I am  trying to run a wbinfo -g on an AD memberserver in an  AD with 
more the 100.000 groups and it shows no output

The samba logs shows
   list_groups XXX
[2021/05/17 14:21:49.826967,  1] ../../librpc/ndr/ndr.c:632(_ndr_pull_error)
   ndr_pull_array_size: ndr_pull_error(Range Error): More than 65535 NDR 
tokens stored for array_size at ../../librpc/ndr/ndr.c:1093

the wbinfo -g is still working with samba-4.10 on CentOS-7.
I am wondering it thhe following change

https://github.com/samba-team/samba/commit/7a0ed44b0e65e742a778915d493e17f04c43b2ef#diff-6a1478caa948ca1d186a648c470ded02699da3705181b633232d582a7c73576d

/*
  * This value is arbitary, but designed to reduce the memory a client
  * can allocate and the work the client can force in processing a
  * malicious packet.
  *
  * In an ideal world this would be controlled by range() restrictions
  * on array sizes and careful IDL construction to avoid arbitary
  * linked lists, but this is a backstop for now.
  */
#define NDR_TOKEN_MAX_LIST_SIZE 65535

leads to this error?

regards

Hansjörg







----------------------------
Unser System ist mit einem Mailverschluesselungs-Gateway ausgestattet. Wenn Sie moechten, dass an Sie gerichtete E-Mails verschluesselt werden, senden Sie einfach eine S/MIME-signierte E-Mail oder Ihren PGP Public Key an hansjoerg.maurer@itsd.de.

Our system is equipped with an email encryption gateway. If you want email sent to you to be encrypted please send a S/MIME signed email or your PGP public key to hansjoerg.maurer@itsd.de.


