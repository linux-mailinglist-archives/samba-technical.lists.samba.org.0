Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1BD4CD68E
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 15:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Zt5NHd75JlfAQiAlRqCwqTT8/0g5MdLYOb6GERhmSwg=; b=fT4IGyhYZpiaY/rgQ8wqfW7bPK
	/bDLBr8b9OMxhwOh7dzDGp5CXkc+KC9GRn9vUcBpCQ1ljakJKs8FXXkYwtDbSFXPSRBigD0oCG4Kk
	WdkJJVqsAslv03BtR1yVzTDHWUXCdik2e3ozIkn3dQ5k4yM8cw2Mu4b8vKKCiWnZ346oriH26/DFB
	9fwetTDl+oraa/KbvhMuutp5LrZU6v8uI6xeX9EHMlXrmbIYPNZmfSPctMx+E5nemD++3moTxj7Yl
	nHOwdsjdaCvXB+zch1JTB94ScHJXqabMzxx2lFSu1lMYnK6njOC2Pnp10yGDaFaoZ3qlPDs32MQao
	u3dncGpw==;
Received: from ip6-localhost ([::1]:25534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQ94M-00FmYt-UJ; Fri, 04 Mar 2022 14:38:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47559) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nQ94H-00FmYk-Ky
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 14:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646404681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zt5NHd75JlfAQiAlRqCwqTT8/0g5MdLYOb6GERhmSwg=;
 b=itQav9Yl5KoA0beesmwZ32X73qL0Gch+UuyuVjL5qmbNjgYWI5IvpWJmwTgkOhUdxGuE1/
 nZ+qWfPUEotISnj6OkTsDfXESLC6dNPmr52Yfz+nghfTJnQLp+hRRuaRbrtQzGTOw8tyPV
 0uk9zJwDvKQTU1uGl1xxGOXKdx4koO0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646404681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zt5NHd75JlfAQiAlRqCwqTT8/0g5MdLYOb6GERhmSwg=;
 b=itQav9Yl5KoA0beesmwZ32X73qL0Gch+UuyuVjL5qmbNjgYWI5IvpWJmwTgkOhUdxGuE1/
 nZ+qWfPUEotISnj6OkTsDfXESLC6dNPmr52Yfz+nghfTJnQLp+hRRuaRbrtQzGTOw8tyPV
 0uk9zJwDvKQTU1uGl1xxGOXKdx4koO0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-ttmNzJFIND-pujDpRFa06Q-1; Fri, 04 Mar 2022 09:21:15 -0500
X-MC-Unique: ttmNzJFIND-pujDpRFa06Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 i5-20020a056402054500b00415ce7443f4so3695010edx.12
 for <samba-technical@lists.samba.org>; Fri, 04 Mar 2022 06:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=Zt5NHd75JlfAQiAlRqCwqTT8/0g5MdLYOb6GERhmSwg=;
 b=uU2xET9iLIz6rdjtaCXfFCYRoM1qQ5HCsuq+awLXemMar9b4vFVI9QZ1fnsRpGtvVz
 0XjxVvk9FOGNDROLJwyDqgTgOLIzBmYchBWEFrsKjdEczImSB170yqnn8TcIn3/xSEyY
 5CAL4NBSDTbeKuxPOk3prbqgQXfInCCZv8sN+cSBOz+8rQAFYZZZ/WRC8WJKDXgDz/Ru
 fVtb4a+8h21+B/ZhpaRdwnr/s/2ufl/nJ8r5BoLhuj9+Uk9Y3o8xCsHbZspCIe7jYkOx
 TOL31t6Dgc3kHXxojtsPh2b/jWIGd29RshMLckQh/JRVtUu943+THtPMP4hDUOwMwJ86
 WKsQ==
X-Gm-Message-State: AOAM533XsVjtYRkSF0lLY2zwVDC1KpdL8BIt10d9x3prbYitoqAuZTTM
 WseI/3FgT/c9/sqy6qMrkeI2icgmcL19AgglbHBc9mPdjijVw7KIePRMKVVI5+BGCZ42rHaRTpu
 /CA5JI04/sn95wt1u/DVT8TKzdKIPwsCiDLK5skEPSM12gdDa09QBAOqlHbEjFcWBIShpDwj0sy
 /nSvoa
X-Received: by 2002:a05:6402:5110:b0:415:cf5d:23d7 with SMTP id
 m16-20020a056402511000b00415cf5d23d7mr9294594edd.327.1646403674336; 
 Fri, 04 Mar 2022 06:21:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxuOCZcomzSLYkCdcZrEHX3qbUXtwpAR7GUeeGAr764o1PBRTTTsOBGKDRbjOzeXRrAyXgZg==
X-Received: by 2002:a05:6402:5110:b0:415:cf5d:23d7 with SMTP id
 m16-20020a056402511000b00415cf5d23d7mr9294570edd.327.1646403674026; 
 Fri, 04 Mar 2022 06:21:14 -0800 (PST)
Received: from [10.0.1.3] ([83.240.63.191]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b006daa26de2fbsm1236133ejc.153.2022.03.04.06.21.13
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:21:13 -0800 (PST)
Message-ID: <81206267-0468-54eb-8724-4710d22cae89@redhat.com>
Date: Fri, 4 Mar 2022 15:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: samba-technical@lists.samba.org
Subject: Two samba domains in one forest
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbrezina@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
From: =?utf-8?q?Pavel_B=C5=99ezina_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_B=c5=99ezina?= <pbrezina@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi samba-technical,
is it possible to create a domain trust between two domains to achieve a 
subdomain relationship in a forest? For example child.samba.test <--> 
samba.test.

Thanks,
Pavel


