Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA24A6AF62
	for <lists+samba-technical@lfdr.de>; Thu, 20 Mar 2025 21:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=6Pg0yMQvEUbwsVwGIOfYXyDbiJntQEcUbugX/+LZLgo=; b=abZSEl/oX+pWol7Lbfr1Ry4crQ
	al2yQbNHUB5DKqjz3xz7I+JLFcOZxoA4mffAmTmDZTXmk1cauHFh5asyKY9UmsWqlT2BPEsjBqOug
	7iKoBycN2IdeHulntHnbHcL0adsmBNZwtfLi5wL3egVCaV7G/SFdUzzfpqZnaAoAvCJizO0/1lSWF
	7LMKYT/gn+oReraeivdtIQVSEZXSGtpaT+wJ6JyI3v1ZmnaW7aS5ax+FFmEod3A6n7Wj2IV211IWT
	Wq1271QZrlvc0U794jBvu+AjjYVxI+EYSbD5jWwB8WkRJnhCxIKWikDJmZgGaJBtPJ4iVq+BIt05x
	tj31OAkA==;
Received: from ip6-localhost ([::1]:25796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tvMoQ-00Gcoo-MX; Thu, 20 Mar 2025 20:48:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45307) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tvMoL-00Gcoh-Ps
 for samba-technical@lists.samba.org; Thu, 20 Mar 2025 20:48:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-391342fc148so802148f8f.2
 for <samba-technical@lists.samba.org>; Thu, 20 Mar 2025 13:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1742503684; x=1743108484; darn=lists.samba.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Pg0yMQvEUbwsVwGIOfYXyDbiJntQEcUbugX/+LZLgo=;
 b=VpjD8bH4zSsIV4BF5MxHgFCberVOCFRd/Nc26O+jNKKbufKjvGID0vKoqcB3ScUUjf
 104QViivrIyCFJ9JCiHUgrdd41RXkkYST3+fW4HuB6T95qjgBvoK2fTRtyVj0ELI/ryk
 XCO26WTKd88KymRYHfJWIFzxq9xjXlxHM4u0yI99dOpoPOxj7Q4LOeHL+ayLhzBRc3xx
 pBEjLn1altMkv+Ild9DbLpdq+XTk7oMQexp9MdD4PVl8+fb4sb4DEdWcHTl0xxXxz9iV
 uB2jkqRO8PE8BYP8MsuOlGXv/4qRl49LtUrD7dM+vUGKu/HunS0VVJBSp413yLwZzKcS
 YljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742503684; x=1743108484;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6Pg0yMQvEUbwsVwGIOfYXyDbiJntQEcUbugX/+LZLgo=;
 b=Tmp67qWiH5w6MO8X9JE9lgUvVVDrX9mMoBQFZtUDWXb6yW9Wz0FO4l8t/4EBSmhWA2
 ZO0ey9WUvNSAQktGnhlsBwtrd+sm0tOqHVEri7C+z2J846jqZkiynLNA8ExyDl3uge+H
 CK/dxuUCB6NlI2lKPvjaga5DMvqgoraBPsihYlfhxX9B5pXPhx8OV3DIp2sFxD9osj6W
 sMVYyzPcaCNP2TcWvLtBU90CYxxvK63ABoGVnioGc0g+YaFbXuAPQeeC4aZcrNflZjf7
 lCmg17S1l2aeX29ax0cO35wpAzE9Q3ChVESvcuog/8R0lTQyxFSgx10+IwExO35vdvh+
 CrQQ==
X-Gm-Message-State: AOJu0YyM3L0IcAWe4KswP4Ab+B1wQ2yvBC4v6WLMMLoK86nWj5T/QQ+h
 3/drAGW4RdYyl1+DnKUL4igwtmv+aymbHlcOfL4YPBzsXIpzlkmbGj+sgTrP3d7QrjphxtfhaFr
 p
X-Gm-Gg: ASbGncuzbClutvY+H0b6I69FG9JDLYWWHOh06blzcCcC/AjS8misshtCsRYm3BT5pTg
 rERAvbJc+wYq6IYI0G2OdtmZTggXRQjwjLfzJoTr86juvvSmUbc8iCEFaPQHAJF6Z9Z9Gu3EBv8
 t53vo3zNvQpd9W+Mi6kHwCuYmnqIDpPdgR6n1v2LPkX/2tgBT2eHtm/57mcCBGX1BQbeDevwfTd
 eD8TTyHPMrXGuWZ62iP78tiMUSryZRlXAepss/IUOhqD6Xg1UoMINmbJiZPMPoctCvo2IfUjS7l
 gwqvVQaPL5NcfYUkD6kJ9QscqQie7PgQzx2tEvmbXRokVaFbqG9Nd+vmbzR1Yf8iXsAM
X-Google-Smtp-Source: AGHT+IHWdOFnm35nH7nWyjd3jg8DfF4P63D0GtI2wfaMvUwiHnd39sjnDH7EeJSqxK4WUPiGt+P9/g==
X-Received: by 2002:a05:6000:2801:b0:391:4231:40a with SMTP id
 ffacd0b85a97d-3997f90f67bmr782222f8f.33.1742503684315; 
 Thu, 20 Mar 2025 13:48:04 -0700 (PDT)
Received: from [192.168.1.8] (33bad791.skybroadband.com. [51.186.215.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm58680695e9.22.2025.03.20.13.48.03
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 13:48:04 -0700 (PDT)
Message-ID: <08637347-ceb3-4389-ae5f-bfc97fdea72a@suse.com>
Date: Thu, 20 Mar 2025 20:48:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: samba-technical <samba-technical@lists.samba.org>
Subject: Windows Search Protocol Update
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: Noel Power <nopower@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

Every now and again I get people contacting me asking about progress 
with the Windows Search Protocol server work that I started (a long time 
ago now) and also how to get a hold of the not yet integrated code to 
test. With that in mind I'd like to introduce you to a a new docker 
compose project.

So, if you would ever wanted to try setting up the experimental Windows 
Search Protocol server and have been intimidated by the the prospect of
   o downloading and building a custom version of samba with the windows 
search protocol from source
   o downloading and setting up and configuring either opensearch or 
elasticsearch
   o downloading and setting up fscrawler to index a share location
   o configuring samba and ensuring the opesearch/elasticsearch, samba 
and fscrawler all play together nicely

then https://gitlab.com/npower/wsp-container can help you out.

You can run a test setup (complete with a small set of test files) with 
practically zero configuration see. 
https://gitlab.com/npower/wsp-container#quick-start---test-mode There is 
also has a fuller demo mode with some more advanced configuration examples.

Please try it out :-)

Most of the above was prompted by a more focussed attempt to provide 
some documentation around the WSP server and setting things up (and 
realising it is a bit tricky). Please see. 
https://wiki.samba.org/index.php/WSP

Regarding progress of integration of this feature I have recently 
updated all the associated merge requests to do with the windows search 
protocol server support

There are now 3 merge requests

a) A merge request for the base async SMB named pipe based (but NOT 
dcerpc) infrastructure to create the WSP service (or a service that uses 
SMB named pipes in the same way). This replaces various other merge 
requests which attempted to integrate with the existing dcerpc micro 
service infrastructure which I have abandoned.

see. https://gitlab.com/samba-team/samba/-/merge_requests/4008

b) A merge request for some usabilty improvements for 
elasticsearch/opensearch (These patches are also relevant for 
spotlight/mdssvc)
   o allow the share config elsaticsearch:index config to use 
substitutions (e.g. form indexname based on authenticated user)
   o allow elasticsearch/opensearch in additiona to anonymous 
authentication use a either use configured username/password or an 
apikey (elasticsearch only).
   o moves some code to a new subsystem so that code can be shared 
between the wsp and spotlight/mdssvc.

see. https://gitlab.com/samba-team/samba/-/merge_requests/3720

c) The Windows Search Protocol server itself, the changes here include 
the other merge requests mentioned above
see. https://gitlab.com/samba-team/samba/-/merge_requests/371


Noel


