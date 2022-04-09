Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B45904FA58F
	for <lists+samba-technical@lfdr.de>; Sat,  9 Apr 2022 09:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=xPyaxJmzNFv3FN0go8npl1SRBw78GnSM68Ql+2+C9WU=; b=cPzrhhomR4kk52qGFRmsBKME2z
	LFs4WdzpLWQQkXapHTyEhKYdeSbsvn9g9p0H0rD/Yhs67HzpKGbiBSExJhB0pdGVJ7VBzCZPJAvxZ
	wdDo9ZdduBDZ1Nc1uD2HW6v3dbPyQuVtQAWGF2guX1W5IfCV9rqazxZku7YqpOD6OHJgnlSWMshne
	V0zdMhCWbJFSn5xQBOI1etztTtG+h0RXma5v9HqZJzOHw1MqTxbeWokZ5o1tamOZgO/j2e+xMqL4T
	Ija5hEhvbzOK6pO7G4L6o3ZVPIWq2ijLOoQq47h4Aj9/qukV8XwYExacJX/3QGU/7Bgyr3EsKX1Og
	81L7w+7Q==;
Received: from ip6-localhost ([::1]:36682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nd5It-00BHfN-Nf; Sat, 09 Apr 2022 07:14:39 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:46723) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nd5Io-00BHfE-Fk
 for samba-technical@lists.samba.org; Sat, 09 Apr 2022 07:14:36 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 35C0E40161
 for <samba-technical@lists.samba.org>; Sat,  9 Apr 2022 10:14:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CFC00352
 for <samba-technical@lists.samba.org>; Sat,  9 Apr 2022 10:10:45 +0300 (MSK)
Message-ID: <d210d52b-40f2-9420-9c12-9b5207fda5a1@msgid.tls.msk.ru>
Date: Sat, 9 Apr 2022 10:14:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: waf and building python modules for multiple python versions
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

How it is possible to build python modules for the libraries
shiped by samba (such as talloc, tdb etc) for multiple python
versions? (*)

I'm not a python expert so the following might be inaccurate,
especially the usage of words.

When you ship a python module using any standard declarative
file for python, such as setup.py. From this file, automatic
tools do exist to produce and install a python module for any
given installed python version. In debian, we have helper
tools that automatically build things for whatever python
versions being installed on the system (pybuild).

Here with waf, I don't see how it is possible. Well, I do
see one possibility: to copy source into yet another separate
subdir (as many subdirs as there are additional python
versions for the build) and run configure & build & install
in every of them in turn, specifying the right PYTHON= in
the environment.  This *should* work.

(another question is how to install just the given target
instead of installing the whole thing, again, into its own
subdir, and picking just the python modules from there).

But this is insanely ugly and requires a lot of extra
recompilation of everything on each build.

Is there a better approach?  How about I build for "default"
python first, and re-build it with PYTHON=otherpython?

(*)
Building for multiple python versions helps transitions
from one version to another. When you plan such transition,
say, from 3.9 to 3.10, you may compile many packages in
a way so they provide *two* python versions in a single
package, and when you switch python, you don't have to
rebuild everything python-related, most stuff is already
ready. And before the next transition, many updated
packages, again, will have support for both python
versions - 3.10 and the next planning 3.11.

Thanks,

/mjt

