Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D29A26DF14C
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 11:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RrBLSWnA7vef+Q7Zbf/FvH2E/imLXAGvsFpqUz/PQTI=; b=GyHyf0gr/pxrsqux56R1uIv7nd
	anSwZzwa8mNwUV4KoZjyQShcjhyrRehsjBPDIPPBfnCuZZucudcc1+S0zzmTKjGln7Gj2a/V1/mVk
	G1JXutjCt0VCcsiBLxMMznS9+8voQowRONQ67/Pl1bB2V00PNX9N+9pyDF/ruexM52tDafai03/Pa
	HKRaEbJLLgBFj0/9pJMUEfEi2iLPDK6Wrv8P0JrfCYHNjDHaW3OSAAugX0WEndR0izccZUtAkQb/W
	nrlhBhOwYbYlTVnFEmvevYKLlrUdkTdoCI0NssIy7EeWdtll02/UPv3a7wUioZaBm2nqmbpnGjbqd
	jqnbDG9w==;
Received: from ip6-localhost ([::1]:59484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmXFC-000dNh-Fn; Wed, 12 Apr 2023 09:58:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44795) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmXF7-000dNY-3F
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 09:58:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d9so10369251wrb.11
 for <samba-technical@lists.samba.org>; Wed, 12 Apr 2023 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comind-io.20210112.gappssmtp.com; s=20210112; t=1681293500;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrBLSWnA7vef+Q7Zbf/FvH2E/imLXAGvsFpqUz/PQTI=;
 b=HBIPje3n/CkUPzhkU1ap/k9ji90Fy6HK7g7G/lsO0C+8kWV9Wnx2K3cZdDMRV90pNk
 GY/JB/JdlMWXdyIHTAJDoCv3X0Zw/JVx9lOos+j8LNHSGJgY/UOB/Y8rQs3CXemGGlcK
 9h8HrR2nEPORWNj29Gz+893PM2oPSdHFptIfmLCcpo6IMF5Nr57zrMrhQ6ANNF2mWxbt
 UZhd410+NHCTnCSSmyfzmFGvkD7cvEBsPI835uv4Er3BZKFXLYLO/4FzsNqQQguFNfxk
 M7N+luvEnC8bxr0PRBu0b1RNh7xW6Xke4qEs/qmtc+lxC9hDIyxViOfqyHg8oExr95VF
 FYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681293500;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RrBLSWnA7vef+Q7Zbf/FvH2E/imLXAGvsFpqUz/PQTI=;
 b=gpzac9LMYqwYsCDi2eiwrG0b9zKUC8AoeKw9OGIZanDZTGQVnhKj49hxSb3ddlb4bU
 n03bz6qtC8rkcnFitwVufp2KxDjIQ2PijbjayEY68NkCm4O3ClNhWEFdgY1qhCqImvUL
 rxpGZ8KoXl4Zo+eeInNHItmk9szW/n8Atf1E0SvCQA87wYT3e9advB9wydrFhvheLne3
 fsSAtynk/cHw5Wu8fd55CHKZWphLSb80mG4Dno4nUSAXZQgVKLXz2oMCIYb7opcr80rf
 kYgzlanAQ8jDPjV01QvT5XdF0HCgfQLg+faRyJ40hUfAQ+OiiTgu47yfJWm+wDOAMcF/
 0xhA==
X-Gm-Message-State: AAQBX9f+ZfZBPuLPV85/IcHDG4ThRJgZ66VmRNy6HeYyrwEd885Gt2Wa
 cpXMAtjm4a3Dp2xOngbY6i+Ao9eFhg/sedRHkt8=
X-Google-Smtp-Source: AKy350biGq0ZOn5p7KsbuGJXTcyvA/g45UEmoB9lDLypnsCTH5sUWnrrqx/92Smh1ZyUbKgdhwQkvQ==
X-Received: by 2002:a5d:4581:0:b0:2ef:aeb7:5add with SMTP id
 p1-20020a5d4581000000b002efaeb75addmr10794086wrq.68.1681293499572; 
 Wed, 12 Apr 2023 02:58:19 -0700 (PDT)
Received: from [192.168.50.106] (83-244-193-76.cust-83.exponential-e.net.
 [83.244.193.76]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056000180d00b002efac42ff35sm14609221wrh.37.2023.04.12.02.58.19
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 02:58:19 -0700 (PDT)
Message-ID: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
Date: Wed, 12 Apr 2023 10:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: How to test samba LDAP parameters with openldap tools, eg ldapsearch?
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
From: Jan Andersen via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jan Andersen <jan@comind.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have an openLDAP service running on a debian 11 system, and Samba 4.13 
on another Debian 11. In smb.conf I have set up the following:

   # LDAP Settings
   passdb backend = ldapsam:ldap://vogon.zombie.io
   ldap suffix = dc=zombie,dc=io
   ldap user suffix = ou=people
   ldap group suffix = ou=groups
   ldap machine suffix = ou=computers
   ldap idmap suffix = ou=Idmap
   ldap admin dn = cn=admin,dc=zombie,dc=io
   ldap ssl = start tls
   ldap passwd sync = yes

I have some trouble understanding why this doesn't appear to work, and I 
would like to try to understand how these parameters map to the 
parameters of, say, ldapsearch, so I can see if the problem lies there.

I have run smbd with max debugging, and as far as I can see, it 
successfully makes contact with the LDAP server, but then doesn't find 
the user I'm trying to log in with. However, when I do a search with 
ldapsearch, like this:

ldapsearch -v -b "dc=zombie,dc=io" -H ldaps://vogon.zombie.io -D 
"cn=admin,dc=zombie,dc=io" -W

- I find the user in the output. So, my question is, which ldapsearch 
command would be equivalent to what smbd is doing?

